import 'package:flutter/material.dart';
import 'package:pokedex/common/errors/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/models/repositories/pokemon_repository.dart';
import 'package:pokedex/features/pokedex/screens/details/container/details_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_error.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_loading.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository, required this.onItemTap}) : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailsArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: repository.getAllPokemons(),
        builder: (builder, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container();
            case ConnectionState.waiting:
              return HomeLoading();
            case ConnectionState.active:
              return Container();
            case ConnectionState.done:
              if (snapshot.hasData)
                return HomePage(list: snapshot.data!,onItemTap: onItemTap);
              else if (snapshot.hasError)
                return HomeError(texto: (snapshot.error as Failure).message!);
              else
                return Container();
            default:
              Container();
          }
          return Container();
        });
  }
}
