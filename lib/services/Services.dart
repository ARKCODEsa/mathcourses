import 'package:flutter/material.dart';

//creamos la clase Services que extiende de StatefulWidget
class Services extends StatefulWidget {
  const Services({super.key});

  @override
  _ServicesState createState() => _ServicesState();
}

//creamos la clase _ServicesState que extiende de State
class _ServicesState extends State<Services> {
  //creamos una lista de servicios del 1 al 10
  final List<String> _services = List<String>.generate(10, (i) => 'Service ${i + 1}');

  //creamos el metodo build que se encarga de construir la interfaz
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
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.builder(
                itemCount: _services.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_services[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}