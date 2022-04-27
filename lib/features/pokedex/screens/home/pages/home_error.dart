import 'package:flutter/material.dart';

class HomeError extends StatelessWidget {
  const HomeError({Key? key, required this.texto}) : super(key: key);
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(texto),
      ),
    );
  }
}
