import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/data/services/pokemon_service/ipokemon_service.dart';
import 'package:pokedex/data/states/charging_state.dart';

class HomeModel extends StateNotifier<ChargingState>{
  
  final IPokemonService pokemonService;

  HomeModel({ required this.pokemonService }) : super(const ChargingState.loading()){
    loadSpecies();
  }

  Future<void> loadSpecies() async {
    try {
      final response = await pokemonService.getPokemons();
      state = ChargingState.data(response);
    } catch (e) {
      print(e);
      state = const ChargingState.error('Whoops, an unexpected error occurred, please try again');
    }
  }
  
}