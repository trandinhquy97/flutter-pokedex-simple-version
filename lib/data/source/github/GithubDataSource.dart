import 'dart:convert';

import 'package:flutter_test_call_api_pokedex/core/network.dart';

import 'models/pokemons.dart';

class GithubDataSource {
  const GithubDataSource(this.networkManager);

  static const String url =
      'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json';

  final NetworkManager networkManager;

  Future<List<GithubPokemonModel>> getPokemons() async {
    final response = await networkManager.request(RequestMethod.get, url);

    final data = (json.decode(response.data) as List).map((item) => GithubPokemonModel.fromJson(item)).toList();

    return data;
  }
}