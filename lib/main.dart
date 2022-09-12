import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_call_api_pokedex/core/network.dart';
import 'package:flutter_test_call_api_pokedex/data/repository/pokemon_repository.dart';
import 'package:flutter_test_call_api_pokedex/data/source/github/GithubDataSource.dart';
import 'package:flutter_test_call_api_pokedex/states/pokemon/pokemon_bloc.dart';
import 'package:flutter_test_call_api_pokedex/ui/screens/test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        //Services
        RepositoryProvider<NetworkManager>(create: (context) => NetworkManager()),
        //DataSource
        RepositoryProvider<GithubDataSource>(
            create: (context) =>
                GithubDataSource(context.read<NetworkManager>())),
        //Repositories
        RepositoryProvider<PokemonRepository>(
            create: (context) =>
                PokemonDefaultRepository(githubDataSource: context.read<GithubDataSource>()))
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PokemonBloc>(create: (context) => PokemonBloc(context.read<PokemonRepository>()))
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const TestScreen2(),
        ),
      ),
    );
  }
}
