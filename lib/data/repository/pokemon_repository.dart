import 'package:flutter_test_call_api_pokedex/data/source/github/GithubDataSource.dart';
import 'package:flutter_test_call_api_pokedex/data/source/mappers/server_to_entity_mapper.dart';

import '../../domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons();
}

class PokemonDefaultRepository  extends PokemonRepository {

  PokemonDefaultRepository({required this.githubDataSource});

  final GithubDataSource githubDataSource;

  @override
  Future<List<Pokemon>> getPokemons() async {
    final pokemonGithubModels = await githubDataSource.getPokemons();

    final pokemonEntities = pokemonGithubModels.map((e) => e.toEntity()).toList();

    return pokemonEntities;
  }
}
