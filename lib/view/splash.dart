import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_caffeine/view/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String idKey = 'splashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, LoginScreen.idKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 250,left: 100,right: 100,bottom: 250),
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage('assets/images/ic_app.png'), fit: BoxFit.fill),
      ),
    );
  }
}
