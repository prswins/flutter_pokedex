import 'package:flutter/material.dart';
import 'package:pokedex/common/errors/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/models/repositories/pokemon_repository.dart';
import 'package:pokedex/common/widgets/po_error.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/details_error.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/details_loading.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/details_page.dart';

class DetailsArguments {
  DetailsArguments({this.index = 0, required this.pokemon});
  final Pokemon pokemon;
  final int? index;
}

class DetailContainer extends StatefulWidget {
  const DetailContainer({
    Key? key,
    required this.repository,
    required this.arguments,
    required this.onBackPressed,
  }) : super(key: key);
  final IPokemonRepository repository;
  final DetailsArguments arguments;
  final VoidCallback onBackPressed;

  @override
  _DetailContainerState createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _pageController;
  late Future<List<Pokemon>> future;
   Pokemon? _pokemon;

  @override
  void initState() {
    _pageController = PageController(
        viewportFraction: 0.5, initialPage: widget.arguments.index!);
    future = widget.repository.getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
        future: future,
        builder: (builder, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container();
            case ConnectionState.waiting:
              return DetailsLoading();
            case ConnectionState.active:
              return Container();
            case ConnectionState.done:
              if (snapshot.hasData) {
                if (_pokemon == null) _pokemon = widget.arguments.pokemon;

                return DetailsPage(
                  pokemon: _pokemon!,
                  list: snapshot.data!,
                  onBackPressed: widget.onBackPressed,
                  pageController: _pageController,
                  onChangePokemon: (Pokemon value) {
                    setState(() {
                      _pokemon = value;
                    });
                  },
                );
              } else if (snapshot.hasError)
                return PoError(error: (snapshot.error as Failure).message!);
              else
                return Container();
            default:
              Container();
          }
          return Container();
        });
  }
}
