import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  bool isLoaded = false;
  late CameraPosition _kCurrentLocation;
  late CameraPosition _kLake;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Map'), centerTitle: true),
      body: _body(),
      floatingActionButton: fab(),
    );
  }

  Widget _body() {
    return isLoaded
        ? GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: _kCurrentLocation,
            markers: Set<Marker>.of(markers),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          )
        : Center(child: CircularProgressIndicator());
  }

  Widget fab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showSnackbar('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showSnackbar('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      _showSnackbar(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    final cPosition = await Geolocator.getCurrentPosition().onError((e, s) {
      _showSnackbar(
          'User denied permissions to access the device\'s location.');
      return Position(
        longitude: -122.085749655962,
        latitude: 37.42796133580664,
        timestamp: DateTime.now(),
        accuracy: 14,
        altitude: 14,
        altitudeAccuracy: 14,
        heading: 14,
        headingAccuracy: 14,
        speed: 1,
        speedAccuracy: 14,
      );
    });

    markers.add(
      Marker(
        markerId: MarkerId('MyLocation'),
        position: LatLng(cPosition.latitude, cPosition.longitude),
      ),
    );

    _kCurrentLocation = CameraPosition(
      target: LatLng(cPosition.latitude, cPosition.longitude),
      zoom: 7,
    );

    _kLake = CameraPosition(
      target: LatLng(37.43296265331129, -122.08832357078792),
      zoom: 19.151926040649414,
    );

    setState(() {
      isLoaded = true;
    });
  }

  _showSnackbar(String msg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(msg)));
  }
}
