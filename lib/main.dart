import 'package:flutter/material.dart';
import 'package:mathcourses/contact_us/Contact_us.dart';
import 'package:mathcourses/services/courses/Aerospace.dart';
import 'package:mathcourses/sign_in/sign_In.dart';
import 'package:mathcourses/sign_up/sign_Up.dart';
import 'package:mathcourses/splash/Splash.dart';
import 'package:mathcourses/who_we_are/Who_we_are.dart';
import 'package:mathcourses/services/Services.dart';
import 'package:mathcourses/services/courses/Applied_Mathematics.dart';
import 'package:mathcourses/services/courses/Architecture.dart';
import 'package:mathcourses/services/courses/Art.dart';
import 'package:mathcourses/services/courses/Astrology.dart';
import 'package:mathcourses/services/courses/Biology.dart';
import 'package:mathcourses/services/courses/Chemistry.dart';
import 'package:mathcourses/api_service.dart';

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
        '/courses/Aerospace': (context) => const Aerospace(),
        '/courses/Applied_Mathematics': (context) => const AppliedMathematics(),
        '/courses/Architecture': (context) => const Architecture(),
        '/courses/Art': (context) => const Art(),
        '/courses/Astrology': (context) => const Astrology(),
        '/courses/Biology': (context) => const Biology(),
        '/courses/Chemistry': (context) => const Chemistry(),
      },
    );
  }
}