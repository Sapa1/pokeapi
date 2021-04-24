class Pokemon {
  String nome;
  String urlImage;
  List<Ability> abilities;

  Pokemon.fromJson(Map<String, dynamic> json) {
    nome = json['name'];
    urlImage = json['sprites']['front_default'];

    var arrayAbilities = json['abilities'] as List;

    abilities = arrayAbilities.map((item) {
      return Ability.fromJsom(item['ability']);
    }).toList();
  }
}

class Ability {
  String name;
  String url;

  Ability.fromJsom(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
