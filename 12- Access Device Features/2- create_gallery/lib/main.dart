import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final ImagePicker picker = ImagePicker();
  List<File> imgs = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          _imgsList(),
          _btns(
            () => _pickImgFromCamera(),
            'Pick Image From Camera',
          ),
          _btns(
            () => _pickImgFromGallery(),
            'Pick Image From Gallery',
          ),
          _btns(
            () => _pickMultipleImgsFromGallery(),
            'Pick Multiple Images From Gallery',
          )
        ],
      )),
    );
  }

  Widget _imgsList() {
    return Expanded(
      child: imgs.isEmpty
          ? Center(child: Text('No Images Found! Pick Some'))
          : ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: imgs.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.file(imgs[index]),
              ),
            ),
    );
  }

  Widget _btns(Function()? onPressed, String txt) {
    return FilledButton(onPressed: onPressed, child: Text(txt));
  }

  void _pickImgFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imgs.add(File(image.path));
    }
    setState(() {});
  }

  void _pickImgFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imgs.add(File(image.path));
    }
    setState(() {});
  }

  void _pickMultipleImgsFromGallery() async {
    final List<XFile> images = await picker.pickMultiImage();
    if (images.isNotEmpty) {
      for (var img in images) {
        imgs.add(File(img.path));
      }
    }
    setState(() {});
  }
}
