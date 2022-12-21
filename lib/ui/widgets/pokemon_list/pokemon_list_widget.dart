import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/data/model/pokemon.dart';
import 'package:pokedex/ui/widgets/pokemon_item/pokemon_item_widget.dart';

class PokemonListWidget extends ConsumerStatefulWidget {
  final List<Pokemon> pokemonList;
  const PokemonListWidget({Key? key, required this.pokemonList}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PokemonListWidgetState();
}

class _PokemonListWidgetState extends ConsumerState<PokemonListWidget> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.pokemonList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: ((_, index) {
        final pokemon = widget.pokemonList[index];
        return Consumer(builder: (_, ref, __) {
            return PokemonItemWidget(
              pokemon: pokemon,
            );
          }
        );
      }),
    );
  }
}