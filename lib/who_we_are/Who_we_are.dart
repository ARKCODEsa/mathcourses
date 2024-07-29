import 'package:flutter/material.dart';

class WhoWeAre extends StatelessWidget {
  const WhoWeAre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Who We Are'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('lib/images/who_we_are.png'),
            const SizedBox(height: 20.0),
            const Text(
              'Math Courses',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Math Courses is a site where you will find courses aimed at technology, physics, chemistry, mathematics, cooking courses, art, '
                  'architecture, design, animation, and much more. Our goal is to provide a comprehensive educational platform that covers a wide '
                  'range of disciplines to meet everyone''s learning needs.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sign_in');
              },
              child: const Text('Next ->'),
            ),
          ],
        ),
      ),
    );
  }
}