import 'package:flutter_test_call_api_pokedex/domain/entities/pokemon.dart';

enum PokemonStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadMore,
  loadMoreSuccess,
  loadMoreFailure
}

class PokemonState {
  const PokemonState._(
      {this.status = PokemonStateStatus.initial,
      this.pokemons = const [],
      this.error});

  const PokemonState.initial() : this._();

  final PokemonStateStatus status;
  final List<Pokemon> pokemons;
  final Exception? error;

  PokemonState copyWith(
      {PokemonStateStatus? status, List<Pokemon>? pokemons, Exception? error}) {
    return PokemonState._(
        status: status ?? this.status,
        pokemons: pokemons ?? this.pokemons,
        error: error ?? this.error);
  }

  PokemonState asLoading() {
    return copyWith(status: PokemonStateStatus.loading);
  }

  PokemonState asLoadSuccess(List<Pokemon> list) {
    return copyWith(status: PokemonStateStatus.loadSuccess, pokemons: list);
  }

  PokemonState asLoadFailure(Exception e) {
    return copyWith(status: PokemonStateStatus.loadFailure, error: e);
  }
}
