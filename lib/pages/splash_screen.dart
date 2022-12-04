import 'dart:async';

import 'package:firebase_practice/pages/dashboard.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => DashBoard(),
            ),
            (route) => false));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.lightGreen,
        ),
      ),
    );
  }
}
