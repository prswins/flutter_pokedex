import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailsListWidget extends StatelessWidget {
  const DetailsListWidget({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);

  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 60,
        right: 0,
        left: 0,
        height: 400,
        child: Container(
          color: pokemon.baseColor,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(
                      pokemon.name,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                    Text(
                      '# ${pokemon.num}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: PageView(
                  onPageChanged: (index) {
                    onChangePokemon(list[index]);
                  },
                  controller: controller,
                  children: list
                      .map((e) => AnimatedOpacity(
                            duration: Duration(milliseconds: 500),
                            opacity: e != pokemon ? 0.4 : 1.0,
                            child: TweenAnimationBuilder<double>(
                                duration: Duration(milliseconds: 500),
                                tween: Tween<double>(
                                    begin: e != pokemon ? 300 : 100,
                                    end: e != pokemon ? 100 : 300),
                                curve: Curves.easeIn,
                                builder: (context, value, child) {
                                  return Center(
                                    child: Image.network(
                                      e.image,
                                      width: value,
                                      fit: BoxFit.contain,
                                      color: e != pokemon
                                          ? Colors.black.withOpacity(0.4)
                                          : null,
                                    ),
                                  );
                                }),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ));
  }
}
