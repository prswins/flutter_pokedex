import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/container/details_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widgets/pokemon_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap})
      : super(key: key);
  final List<Pokemon> list;
  final Function(String, DetailsArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Pokedex", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.black,))],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        children: list.map((e) => PokemonItemWidget(pokemon: e, onTap: onItemTap,index: list.indexOf(e),)).toList(),
      ),
    );
  }
}
