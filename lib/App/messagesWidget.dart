import 'package:flutter/material.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class MessagesWidget extends StatefulWidget {
  MessagesWidget({super.key});

  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {

  File? _pickedImage;
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: source);

    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    } else {
      // User canceled the picker
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      body: Center(
        child: _pickedImage == null
            ? Text('No image selected.')
            : Image.file(_pickedImage!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _pickImage(ImageSource.gallery); // Use ImageSource.camera for camera input
        },
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}