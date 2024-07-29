import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mathcourses/who_we_are/Who_we_are.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WhoWeAre()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Math Courses',
      home: Scaffold(
        body: Center(
          child: Image(
            image: AssetImage('lib/images/logo.png'),
          ),
        ),
      ),
    );
  }
}