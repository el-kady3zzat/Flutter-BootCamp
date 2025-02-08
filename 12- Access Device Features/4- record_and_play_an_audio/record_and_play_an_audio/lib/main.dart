import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';
import 'package:record_and_play_an_audio/player.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final record = AudioRecorder();
  AudioPlayer player = AudioPlayer();
  bool recordStarted = false;
  bool hasRecord = false;
  String path = '';
  String fileName = '';

  @override
  void initState() {
    super.initState();
    _getPath();

    // Create the audio player.
    player = AudioPlayer();

    // Set the release mode to keep the source after playback has completed.
    player.setReleaseMode(ReleaseMode.stop);
  }

  _getPath() async {
    // Get the app's documents directory
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    path = appDocDir.path;
  }

  void _startRecording() async {
    // Check and request permission if needed
    if (await record.hasPermission()) {
      fileName = 'file_${DateTime.now().second.toString()}';
      // Start recording to file
      await record.start(const RecordConfig(), path: '$path/$fileName.m4a');
      recordStarted = true;
      setState(() {});
    }
  }

  void _stopRecording() async {
    // Stop recording.
    final path = await record.stop();
    if (path != null) {
      _playRecord(path);
    } else {
      debugPrint('=====\nPath is null\n=====');
    }
    hasRecord = true;
    recordStarted = false;
    setState(() {});
  }

  void _cancelRecording() async {
    // Cancel it (and implicitly remove file/blob).
    await record.cancel();
    recordStarted = false;
    setState(() {});
  }

  void _playRecord(String path) async {
    await player.setSourceDeviceFile(path);
  }

  @override
  void dispose() {
    record.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Voice Recorder'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _btn('Record Audio', () => _startRecording()),
                      SizedBox(height: 16),
                      if (recordStarted)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _btn('Stop', () => _stopRecording()),
                            _btn('Cancel', () => _cancelRecording()),
                          ],
                        )
                    ],
                  ),
                ),
                hasRecord
                    ? PlayerWidget(player: player, fileName: fileName)
                    : SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _btn(String label, void Function() onPressed) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(onPressed: onPressed, child: Text(label)),
    );
  }
}
