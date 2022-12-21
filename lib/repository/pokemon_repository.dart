import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/core/utils/app_providers.dart';
import 'package:pokedex/data/states/charging_state.dart';
import 'package:pokedex/ui/screens/home/home_model.dart';

final pokemonProvider = StateNotifierProvider<HomeModel, ChargingState>((ref) {
  final pokemonService = ref.watch(pokemonServiceProvider);
  return HomeModel(pokemonService: pokemonService);
});