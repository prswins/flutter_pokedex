import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/details_app_bar_widget.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/widgets/details_list_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBackPressed,
    required this.pageController,
    required this.onChangePokemon,
  }) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBackPressed;
  final PageController pageController;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        DetailsAppBarWidget(pokemon: pokemon, onBackPressed: onBackPressed),
        DetailsListWidget(
          pokemon: pokemon,
          list: list,
          controller: pageController,
          onChangePokemon: onChangePokemon,
        )
      ],
    ));
  }
}
