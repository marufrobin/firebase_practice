import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  TextEditingController _nameControll = TextEditingController();
  TextEditingController _phoneControll = TextEditingController();
  TextEditingController _emailControll = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  File? imageTemp;
  XFile? xFile;
  addImage() async {
    xFile = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      File imageTemp = File(xFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Color(0xff42ED18),
              size: 36,
            )),
        title: Text("Student Management",
            style: TextStyle(color: Color(0xff575252))),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_rounded,
                color: Color(0xff42ED18),
                size: 30,
              ))
        ],
      ),
      body: GridView.count(
          childAspectRatio: (1 / 1.2),
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(8),
          children: List.generate(
              16,
              (index) => Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xff42ED18), width: 2),
                        color: Color(0xffCCF1D4),
                        borderRadius: BorderRadius.circular(16)),
                    margin: EdgeInsets.all(4),
                  ))),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            buildAddStudent(context);
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xff42ED18)),
    );
  }

  Future<dynamic> buildAddStudent(BuildContext context) {
    return showModalBottomSheet(
      elevation: 0,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          color: Colors.transparent,
          child: Stack(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height * 0.5,
                margin: EdgeInsets.only(
                  top: 80,
                ),
                padding: EdgeInsets.only(top: 80, left: 16, right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(26),
                      topLeft: Radius.circular(26)),
                  color: Color(0xffCCF1D4),
                ),
                child: Column(
                  children: [
                    buildTextField(_nameControll, "Enter name"),
                    SizedBox(height: 16),
                    buildTextField(_phoneControll, "Enter phone number"),
                    SizedBox(height: 16),
                    buildTextField(_emailControll, "Enter email"),
                    SizedBox(height: 16),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff42ED18))),
                        onPressed: () {},
                        child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 130, vertical: 16),
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff1B1313)),
                            )))
                  ],
                ),
              ),
              Positioned(
                left: 140,
                top: 16,
                child: CircleAvatar(
                  radius: 62,
                  backgroundColor: Color(0xff42ED18),
                  child: CircleAvatar(
                    backgroundColor: Color(0xffE2FCE7),
                    radius: 60,
                    child: xFile == null
                        ? IconButton(
                            onPressed: () {
                              addImage();
                            },
                            icon: Icon(
                              Icons.add_photo_alternate_rounded,
                              size: 30,
                              color: Color(0xff795D5D),
                            ))
                        : Image.file(imageTemp!),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  TextField buildTextField(
      TextEditingController controller, String textOnField) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: textOnField,
        hintText: textOnField,
        alignLabelWithHint: false,
        fillColor: Colors.white,
        focusColor: Color(0xff42ED18),
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            gapPadding: 2,
            borderSide: BorderSide(color: Color(0xff42ED18))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            gapPadding: 2,
            borderSide: BorderSide(color: Color(0xff42ED18))),
      ),
    );
  }
}
