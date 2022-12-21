import 'package:pokedex/data/model/pokemon.dart';

abstract class IPokemonService {
  Future<List<Pokemon>> getPokemons();
}