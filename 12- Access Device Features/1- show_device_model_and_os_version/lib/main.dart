import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String info = '';

  @override
  void initState() {
    super.initState();
    _getDeviceData();
  }

  Future _getDeviceData() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    info = '''
==========================================================
==========================================================
    Device Model: ${androidInfo.model}
    OS Version: ${androidInfo.version.release}
==========================================================
==========================================================

Board: ${androidInfo.board}
==========================================================
Boot Loader: ${androidInfo.bootloader}
==========================================================
Brand: ${androidInfo.brand}
==========================================================
Device: ${androidInfo.device}
==========================================================
Display: ${androidInfo.display}
==========================================================
Hardware: ${androidInfo.hardware}
==========================================================
Host: ${androidInfo.host}
==========================================================
Id: ${androidInfo.id}
==========================================================
Is Low Ram Device: ${androidInfo.isLowRamDevice}
==========================================================
Is Physical Device: ${androidInfo.isPhysicalDevice}
==========================================================
Manufacturer: ${androidInfo.manufacturer}
==========================================================
Product: ${androidInfo.product}
==========================================================
Serial Number: ${androidInfo.serialNumber}
==========================================================
Supported 32 Bit Abis: ${androidInfo.supported32BitAbis}
==========================================================
Supported 64 Bit Abis: ${androidInfo.supported64BitAbis}
==========================================================
Supported Abis: ${androidInfo.supportedAbis}
==========================================================
Tags: ${androidInfo.tags}
==========================================================
Type: ${androidInfo.type}''';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Device Info'), centerTitle: true),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Text(
                info,
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
