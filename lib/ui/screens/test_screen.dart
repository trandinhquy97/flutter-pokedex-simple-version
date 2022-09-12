import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_call_api_pokedex/states/pokemon/pokemon_bloc.dart';
import 'package:flutter_test_call_api_pokedex/states/pokemon/pokemon_event.dart';

import '../../domain/entities/pokemon_state.dart';

class TestScreen2 extends StatefulWidget {
  const TestScreen2({Key? key}) : super(key: key);

  @override
  State<TestScreen2> createState() => _TestScreen2State();
}

class _TestScreen2State extends State<TestScreen2> {
  PokemonBloc get pokemonBloc => context.read<PokemonBloc>();

  @override
  void initState() {
    super.initState();
    pokemonBloc.add(const PokemonLoadStarted(loadAll: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<PokemonBloc, PokemonState>(
          bloc: pokemonBloc,
          builder: (context, value) {
            return Text(value.pokemons.length.toString());
          },
        ),
      ),
    );
  }
}
