import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailsAppBarWidget extends StatelessWidget {
  const DetailsAppBarWidget({Key? key, required this.pokemon, required this.onBackPressed}) : super(key: key);
  final Pokemon pokemon;
  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: pokemon.baseColor,
          leading: IconButton(onPressed: onBackPressed, icon:Icon(Icons.arrow_left)),
        ),
      ),
    );
  }
}
