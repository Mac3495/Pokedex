import 'dart:convert';

import 'package:pokedex/core/utils/app_constants.dart';
import 'package:pokedex/core/utils/network_helper.dart';
import 'package:pokedex/data/model/Pokemon.dart';
import 'package:pokedex/data/model/pokemon_info.dart';
import 'package:pokedex/data/services/pokemon_info_service/ipokemon_info_service.dart';

class PokemonInfoService extends IPokemonInfoService {

  final networkHelper = NetworkHelper(); 

  static const String serviceUrl = AppConstants.urlBase;

  @override
  Future<PokemonInfo> getPokemonInfo(int id) {
    List<int> stats = [];
    return networkHelper.get(
      '$serviceUrl/${id+1}',
    ).then((response) {
      List<Map<String, dynamic>> data = List.from(json.decode(response.body)['stats']);
      stats = data.asMap().entries.map<int>((element) {
        return element.value['base_stat'];
      }).toList();
      final pokemonInfo = PokemonInfo(stats: stats);
      return pokemonInfo;
    });
  }

}