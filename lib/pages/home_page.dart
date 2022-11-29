import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _phoneController = TextEditingController();
    TextEditingController _ageController = TextEditingController();
    TextEditingController _addressController = TextEditingController();

    Future addUser() async {
      CollectionReference _users =
          await FirebaseFirestore.instance.collection("robin");
      _users.add(({
        'name': _nameController.text,
        'phone': _phoneController.text,
        'age': _ageController.text,
        'address': _addressController.text,
      }));
      _nameController.clear();
      _phoneController.clear();
      _ageController.clear();
      _addressController.clear();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Form"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                  hintText: "Phone",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                  hintText: "Age",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                  hintText: "Address",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ElevatedButton(
                onPressed: () {
                  addUser();
                },
                child: Text("Register Now"))
          ],
        ),
      ),
    );
  }
}
