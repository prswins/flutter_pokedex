import 'package:flutter/material.dart';

class DetailsError extends StatelessWidget {
  const DetailsError({Key? key, required this.texto}) : super(key: key);
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
