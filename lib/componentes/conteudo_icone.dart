import 'package:app_calculadoraimc/constantes.dart';
import 'package:flutter/material.dart';

class Iconesdesexo extends StatelessWidget {
  Iconesdesexo({required this.iconesDoApp, required this.textoDosIcones});

  // ignore: empty_constructor_bodies
  final IconData iconesDoApp;
  final String textoDosIcones;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconesDoApp,
          size: 95.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          textoDosIcones,
          style: styleDosIcones,
        ),
      ],
    );
  }
}
