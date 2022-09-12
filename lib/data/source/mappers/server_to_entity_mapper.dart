import 'package:flutter_test_call_api_pokedex/core/extensions/string.dart';
import 'package:flutter_test_call_api_pokedex/data/source/github/models/pokemons.dart';
import 'package:flutter_test_call_api_pokedex/domain/entities/pokemon.dart';

extension PokemonModelX on GithubPokemonModel {
  Pokemon toEntity({List<GithubPokemonModel> evolutions = const []}) =>
      Pokemon(number: id.trim(),
          name: name,
          description: xDescription.trim(),
          types: types.map((e) => PokemonTypesX.parse(e)).toList(),
          image: imageUrl.trim(),
          height: height,
          weight: weight,
          genera: category.trim(),
          eggGroups: eggGroups?.split(RegExp(r',\s*?'))
              .map((e) => e.trim())
              .toList() ?? [],
          gender: PokemonGender(
              male: genderMalePercentage?.parseDouble() ?? 0,
              female: genderFemalePercentage?.parseDouble() ?? 0,
              genderless: genderless == 1
          ),
          stats: PokemonStats(
              hp: hp.toInt(),
              speed: speed.toInt(),
              attack: attack.toInt(),
              defense: defense.toInt(),
              specialAttack: specialAttack.toInt(),
              specialDefense: specialDefense.toInt()
          ),
          baseExp: baseExp.parseDouble(),
          evolutions: evolutions.map((e) => e.toEntity()).toList(),
          evolutionReason: '');
}