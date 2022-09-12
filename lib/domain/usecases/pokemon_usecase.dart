import 'package:flutter_test_call_api_pokedex/core/usecase.dart';
import 'package:flutter_test_call_api_pokedex/data/repository/pokemon_repository.dart';

import '../entities/pokemon.dart';

class GetAllPokemonUseCase extends NoParamsUseCase<List<Pokemon>> {
  const GetAllPokemonUseCase(this.repository);

  final PokemonRepository repository;

  @override
  Future<List<Pokemon>> call() {
    return repository.getPokemons();
  }
}
