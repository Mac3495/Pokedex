import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/core/utils/app_arguments.dart';
import 'package:pokedex/core/utils/app_colors.dart';
import 'package:pokedex/data/model/pokemon_info.dart';
import 'package:pokedex/repository/pokemon_info_repositoriy.dart';
import 'package:pokedex/ui/widgets/build_error_widget.dart';
import 'package:pokedex/ui/widgets/stat_information_widget.dart';

import '../../../core/extensions/string_extensions.dart';

class DetailsScreen extends ConsumerStatefulWidget {

  final DetailsArguments arguments;
  const DetailsScreen({super.key, required this.arguments});

  static const String route = '/details';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(pokemonInfoProvider(widget.arguments.pokemon.id));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments.pokemon.name.capitalize()),
      ),
      body: model.when(
        data: (data) {
          final pokemonInfo = data as PokemonInfo;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: widget.arguments.pokemon.url,
                      child: SvgPicture.network( 
                        widget.arguments.pokemon.url,
                        width: size.width - 48, 
                        height: size.height * 0.4,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24,),
                const Text(
                  'Stats:',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondaryText
                  )
                ),
                const SizedBox(height: 24,),
                StatInformationWidget(
                  titleStatOne: 'Hp', 
                  valueStatOne: '${pokemonInfo.stats[0]}',
                  titleStatTwo: 'Attack', 
                  valueStatTwo: '${pokemonInfo.stats[1]}',
                ),
                const SizedBox(height: 12),
                StatInformationWidget(
                  titleStatOne: 'Defense', 
                  valueStatOne: '${pokemonInfo.stats[2]}',
                  titleStatTwo: 'Special\nattack', 
                  valueStatTwo: '${pokemonInfo.stats[3]}',
                ),
                const SizedBox(height: 12),
                StatInformationWidget(
                  titleStatOne: 'Special\ndefense', 
                  valueStatOne: '${pokemonInfo.stats[4]}',
                  titleStatTwo: 'Speed', 
                  valueStatTwo: '${pokemonInfo.stats[5]}',
                )
              ],
            ),
          );
        },
        error: (error) {
        return BuildErrorWidget(errorMessage: error,);
        },
        loading: () => const Center(
            child: CircularProgressIndicator(),
        )
      ),
    );
  }
}