import 'package:flutter/material.dart';

class Astrology extends StatelessWidget {
  const Astrology({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astrology'),
      ),
      body: const Center(
        child: Text('Welcome to Astrology'),
      ),
    );
  }
}