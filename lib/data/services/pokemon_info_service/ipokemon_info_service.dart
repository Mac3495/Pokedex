import 'package:pokedex/data/model/pokemon_info.dart';

abstract class IPokemonInfoService {
  Future<PokemonInfo> getPokemonInfo(int id);
}