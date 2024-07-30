import 'package:flutter/material.dart';
import 'package:mathcourses/services/courses/Aerospace.dart';
import 'package:mathcourses/services/courses/Applied_Mathematics.dart';
import 'package:mathcourses/services/courses/Architecture.dart';
// Import other service files

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final List<String> _services = [
    'Mathematics',
    'Physics',
    'Chemistry',
    'Art',
    'Music',
    'Architecture',
    'Design',
    'Programming',
    'Economics',
    'Finance',
    'Sciences',
    'Astrology',
    'Civil Engineering',
    'Industrial Engineering',
    'Biology',
    'Organic Chemistry',
    'Quantum Physics',
    'Applied Mathematics',
    'Statistics',
    'Computing',
    'Electronics',
    'Mechanics',
    'Aerospace',
    'Medicine',
    'Nursing',
    'Psychology',
    'Sociology',
    'Philosophy',
    'History',
    'Language and Literature',
    'Languages',
  ];

  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.yellow,
    Colors.cyan,
    Colors.pink,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
    Colors.amber,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.limeAccent,
    Colors.orangeAccent,
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.redAccent,
    Colors.tealAccent,
    Colors.yellowAccent,
    Colors.cyanAccent,
    Colors.indigoAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.amberAccent,
  ];

  void _navigateToService(String service) {
    switch (service) {
      case 'Aerospace':
        Navigator.pushNamed(context, '/courses/Aerospace');
        break;
      case 'Applied Mathematics':
        Navigator.pushNamed(context, '/courses/Applied_Mathematics');
        break;
      case 'Architecture':
        Navigator.pushNamed(context, '/courses/Architecture');
        break;
    // Add cases for other services
      default:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ServiceScreen(service: service)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('lib/images/services.png'),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: _services.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _colors[index % _colors.length],
                      ),
                      onPressed: () => _navigateToService(_services[index]),
                      child: Text(_services[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/contact_us');
        },
        tooltip: 'Contact Us',
        child: const Text('ContactUs'),
      ),
    );
  }
}

class ServiceScreen extends StatelessWidget {
  final String service;

  const ServiceScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service),
      ),
      body: Center(
        child: Text('Welcome to $service'),
      ),
    );
  }
}