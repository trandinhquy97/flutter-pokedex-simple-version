abstract class PokemonEvent {
  const PokemonEvent();
}

class PokemonLoadStarted extends PokemonEvent {
  final bool loadAll;

  const PokemonLoadStarted({this.loadAll = false});
}