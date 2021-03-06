// desenho de interface
import 'package:flutter/material.dart';
import 'package:poke_api/poke_controller.dart';
import 'package:poke_api/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final viewModel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.loadPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<Pokemon>(
              stream: viewModel.streamPokemon.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.active) {
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
                  viewModel.loadPokemon();
                });
              },
              child: Text('Load Pokemon'))
        ],
      ),
    );
  }
}
