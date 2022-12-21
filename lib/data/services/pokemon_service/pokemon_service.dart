import 'dart:convert';

import 'package:pokedex/core/utils/app_constants.dart';
import 'package:pokedex/core/utils/network_helper.dart';
import 'package:pokedex/data/model/pokemon.dart';
import 'package:pokedex/data/services/pokemon_service/ipokemon_service.dart';

class PokemonService extends IPokemonService {

  final networkHelper = NetworkHelper(); 

  static const String serviceUrl = '${AppConstants.urlBase}?limit=151';

  @override
  Future<List<Pokemon>> getPokemons() async {
    List<Pokemon> pokemonList = [];
    return networkHelper.get(
      serviceUrl,
    ).then((response) {
      List<Map<String, dynamic>> data = List.from(json.decode(response.body)['results']);
     pokemonList = data.asMap().entries.map<Pokemon>((element) {
          element.value['img'] = "${AppConstants.urlImageBase}${element.key + 1}.svg";
          element.value['id'] = element.key;
          return Pokemon.fromJson(element.value);
      }).toList();
      return pokemonList;
    });
  }
}