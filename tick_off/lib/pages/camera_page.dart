import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();

  // In camera_page.dart

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      Navigator.pop(context, pickedFile);
    } else {
      print('No image selected.');
    }
  }

  Future<void> _takeImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      Navigator.pop(context, pickedFile);
    } else {
      print('No image taken.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null)
              Image.file(
                File(_image!.path),
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: Icon(Icons.photo_library),
              label: Text('Pick Image from Gallery'),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _takeImage,
              icon: Icon(Icons.camera),
              label: Text('Take Image from Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
