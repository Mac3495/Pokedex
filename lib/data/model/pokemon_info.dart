import 'dart:convert';
import 'package:flutter/foundation.dart';

class PokemonInfo {
  List<int> stats;
  PokemonInfo({
    required this.stats,
  });

  PokemonInfo.fromJson(Map<String, dynamic> data)
    : stats = data['stats'];
}