import 'package:flutter/material.dart';

class Art extends StatelessWidget {
  const Art({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Art'),
      ),
      body: const Center(
        child: Text('Welcome to Art'),
      ),
    );
  }
}