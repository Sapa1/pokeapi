// desenho de interface
import 'package:flutter/material.dart';
import 'package:poke_api/poke_controller.dart';
import 'package:poke_api/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<Pokemon>(
              future: controller.pokemon,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Image.network(
                        snapshot.data.urlImage,
                        height: 400,
                        width: 400,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 90,
                        width: 200,
                        child: ListView.builder(
                            itemCount: snapshot.data.abilities.length,
                            itemBuilder: (context, index) {
                              return Text(
                                snapshot.data.abilities[index].name,
                                style: TextStyle(fontSize: 25),
                              );
                            }),
                      ),
                      Text(
                        snapshot.data.nome,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                }
                return Container();
              }),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  controller.loadPokemon();
                });
              },
              child: Text('Load Pokemon'))
        ],
      ),
    );
  }
}
