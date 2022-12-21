import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/core/utils/app_providers.dart';
import 'package:pokedex/data/states/charging_state.dart';
import 'package:pokedex/ui/screens/details/details_model.dart';
import 'package:pokedex/ui/screens/home/home_model.dart';

final pokemonInfoProvider = StateNotifierProvider.family<DetailsModel, ChargingState, int>((ref, id) {
  final pokemonInfoService = ref.watch(pokemonInfoServiceProvider);
  return DetailsModel(pokemonInfoService: pokemonInfoService, id: id);
});