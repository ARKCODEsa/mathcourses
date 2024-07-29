//importaciones necesarias
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mathcourses/contact_us/Contact_us.dart';
import 'package:mathcourses/sign_in/sign_In.dart';
import 'package:mathcourses/sign_up/sign_Up.dart';
import 'package:mathcourses/splash/Splash.dart';
import 'package:mathcourses/who_we_are/Who_we_are.dart';
import 'package:mathcourses/services/Services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Math Courses',
      routes: {
        '/': (context) => const Splash(),
        '/who_we_are': (context) => const WhoWeAre(),
        '/sign_in': (context) => const SignIn(),
        '/sign_up': (context) => const SignUp(),
        '/services': (context) => const Services(),
        '/contact_us': (context) => const ContactUs(),
        // Add other routes here
      },
    );
  }
}
