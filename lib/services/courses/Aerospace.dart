import 'package:flutter/material.dart';

class Aerospace extends StatelessWidget {
  const Aerospace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aerospace'),
      ),
      body: const Center(
        child: Text('Welcome to Aerospace'),
      ),
    );
  }
}