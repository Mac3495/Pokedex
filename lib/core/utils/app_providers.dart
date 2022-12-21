import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/data/services/pokemon_info_service/ipokemon_info_service.dart';
import 'package:pokedex/data/services/pokemon_info_service/pokemon_info_service.dart';
import 'package:pokedex/data/services/pokemon_service/ipokemon_service.dart';
import 'package:pokedex/data/services/pokemon_service/pokemon_service.dart';

final pokemonServiceProvider = Provider<IPokemonService>((ref) {
  return PokemonService();
});

final pokemonInfoServiceProvider = Provider<IPokemonInfoService>((ref) {
  return PokemonInfoService();
});