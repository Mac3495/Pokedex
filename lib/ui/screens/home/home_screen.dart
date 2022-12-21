import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/data/model/pokemon.dart';
import 'package:pokedex/repository/pokemon_repository.dart';
import 'package:pokedex/ui/widgets/build_error_widget.dart';
import 'package:pokedex/ui/widgets/no_data_widget.dart';
import 'package:pokedex/ui/widgets/pokemon_list/pokemon_list_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static const String route = 'home';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(pokemonProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokedex'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                model.when(
                  data: (data) {
                    final pokemonList = data as List<Pokemon>;
                    if (pokemonList.isEmpty) {
                      return  const NoDataWidget(
                        description: 'There are no pokemons yet',
                        lottieAsset: 'assets/lottie/pokeball.json',
                      );
                    }
                    return Column(
                      children: [
                        const SizedBox(height: 12,),
                        PokemonListWidget(
                          pokemonList: pokemonList
                        )
                      ],
                    );
                  },
                  error: (error) {
                  return BuildErrorWidget(errorMessage: error,);
                  },
                  loading: () => const Center(
                      child: CircularProgressIndicator(),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}