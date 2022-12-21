import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/core/utils/app_arguments.dart';
import 'package:pokedex/data/model/pokemon.dart';
import 'package:pokedex/ui/screens/details/details_screen.dart';

import '../../../core/extensions/string_extensions.dart';

class PokemonItemWidget extends ConsumerWidget {
  final Pokemon pokemon;
  const PokemonItemWidget({super.key, required this.pokemon});

  void goToPokemonDetails(BuildContext context){
    final arguments = DetailsArguments(pokemon: pokemon);
    Navigator.pushNamed(context, DetailsScreen.route, arguments: arguments);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () => goToPokemonDetails(context) ,
        child: Container(
          width: double.infinity,
          height: 152,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                pokemon.name.capitalize(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Hero(
                  tag: pokemon.url,
                  child: SvgPicture.network(
                    pokemon.url,
                    width: 125,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}