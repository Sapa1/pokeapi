import 'dart:async';
import 'dart:math';

import 'package:poke_api/poke_model.dart';
import 'package:poke_api/pokemon.dart';

class HomeViewModel {
  final model = PokeModel();

  Future<Pokemon> get pokemon => model.pokemon;

  StreamController<Pokemon> streamPokemon = StreamController();

  loadPokemon() {
    model.fetchPokemon(Random().nextInt(898));
    model.pokemon.then((value) {
      streamPokemon.add(value);
    });
  }
}
