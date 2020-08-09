import 'package:app_slyde_modular_example/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: Observer(builder: (BuildContext context) {
          if (homeController.pokemons.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Error - ${homeController.pokemons.error}'),
                  RaisedButton(
                    onPressed: () {
                      homeController.fetchPokemons();
                    },
                    child: Text('Tentar novamente!'),
                  )
                ],
              ),
            );
          }

          if (homeController.pokemons.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var list = homeController.pokemons.value;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(list[index].name),
              );
            },
          );
        }),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: Center(
      //     child: TextField(
      //       onChanged: (value) {
      //         homeController.text = value;
      //       },
      //       decoration: InputDecoration(labelText: 'Um texto qualquer'),
      //     ),
      //   ),
      // ),
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
