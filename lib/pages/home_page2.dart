import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? xFile;
  File? file;
  addImage() async {
    xFile = await _imagePicker.pickImage(source: ImageSource.camera);
    file = await File(xFile!.path);
    print("Image from fuction path: $file");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Management"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: 600,
                color: Colors.teal,
                child: Expanded(
                  child: xFile == null
                      ? GestureDetector(
                          onTap: () {
                            addImage();
                            print("Fucking Image: $file");
                          },
                          child: Icon(Icons.add_a_photo_rounded))
                      : Image.file(file!),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
