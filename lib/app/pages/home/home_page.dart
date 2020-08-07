import 'package:app_slyde_modular_example/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: TextField(
            onChanged: (value) {
              homeController.text = value;
            },
            decoration: InputDecoration(labelText: 'Um texto qualquer'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Navigator.pushNamed(context, '/other/${homeController.text}');
          Modular.to.pushNamed('/other/${homeController.text}');
        },
      ),
    );
  }
}
