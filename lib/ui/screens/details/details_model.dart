import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/data/services/pokemon_info_service/ipokemon_info_service.dart';
import 'package:pokedex/data/states/charging_state.dart';

class DetailsModel extends StateNotifier<ChargingState>{
  
  final IPokemonInfoService pokemonInfoService;
  final int id;

  DetailsModel({ required this.pokemonInfoService, required this.id}) : super(const ChargingState.loading()){
    loadPokemonInfo(id);
  }

  Future<void> loadPokemonInfo(int id) async {
    try {
      final response = await pokemonInfoService.getPokemonInfo(id);
      state = ChargingState.data(response);
    } catch (e) {
      print(e);
      state = const ChargingState.error('Whoops, an unexpected error occurred, please try again');
    }
  }
  
}