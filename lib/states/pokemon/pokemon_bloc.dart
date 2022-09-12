import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_call_api_pokedex/states/pokemon/pokemon_event.dart';

import '../../data/repository/pokemon_repository.dart';
import '../../domain/entities/pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository _pokemonRepository;

  PokemonBloc(this._pokemonRepository) : super(const PokemonState.initial()) {
    on<PokemonLoadStarted>(
      _onLoadStarted,
    );
  }

  void _onLoadStarted(PokemonLoadStarted event, Emitter<PokemonState> emit) async {
    try {
      emit(state.asLoading());

      final pokemons = await _pokemonRepository.getPokemons();

      emit(state.asLoadSuccess(pokemons));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
