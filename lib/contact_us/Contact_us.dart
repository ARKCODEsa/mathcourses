import 'package:flutter/material.dart';
import 'package:mathcourses/bd/conexion.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final Conexion _conexion = Conexion();

  Future<void> _sendContactUs() async {
    final String name = _nameController.text;
    final String lastName = _lastNameController.text;
    final String phone = _phoneController.text;
    final String email = _emailController.text;
    final String message = _messageController.text;

    if (name.isEmpty || lastName.isEmpty || phone.isEmpty || email.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required')),
      );
      return;
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email format')),
      );
      return;
    }

    await _conexion.contactUs(name, lastName, phone, email, message);

    final Email emailToSend = Email(
      body: 'Name: $name\nLast Name: $lastName\nPhone: $phone\nEmail: $email\nMessage: $message',
      subject: 'Contact Us Form Submission',
      recipients: ['arqjhefferson@hotmail.com'],
      isHTML: false,
    );

    await FlutterEmailSender.send(emailToSend);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Message sent successfully')),
    );

    _nameController.clear();
    _lastNameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('lib/images/contact_us.png'),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Message',
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _sendContactUs,
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}