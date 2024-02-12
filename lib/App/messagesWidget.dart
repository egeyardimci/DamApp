import 'package:flutter/material.dart';
import 'package:agaol/App/bottomBarWidget.dart';
import 'package:agaol/App/topBarWidget.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:agaol/Database/userDatabase.dart';
import "package:provider/provider.dart";
import 'package:firebase_auth/firebase_auth.dart';



class MessagesWidget extends StatefulWidget {
  MessagesWidget({super.key});

  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {

  String imageUrl = "";

  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<User?>(context);

    return Scaffold(
      appBar: TopBarWidget(title: 'DamApp',),
      body: Center(
        child: Container(
          child: imageUrl!= "" ? Image.network(imageUrl) : Container(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ImagePicker imagePicker = ImagePicker();
          XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
          print("${file?.path}");


          Reference referenceRoot = FirebaseStorage.instance.ref();
          Reference referenceImagesDirImages = referenceRoot.child('images');
          Reference referenceImagetoUpload = referenceImagesDirImages.child("dummyfile");

          try{
            await referenceImagetoUpload.putFile(File(file!.path));
            String newimageUrl = await referenceImagetoUpload.getDownloadURL();

            setState(() {
              imageUrl = newimageUrl;
            });
            await userDatabase(uid: user!.uid).updateSingleUserData("picture", imageUrl);
          }
          catch(error) {
            print(error);
          }


          },

        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
      bottomNavigationBar: BottomBarWidget(currentindex: 0,),
    );
  }
}
