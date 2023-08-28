import 'package:app_calculadoraimc/constantes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BotaoInferior extends StatelessWidget {
  BotaoInferior({required this.aoPressionar, required this.textoBotao});

  void Function() aoPressionar;
  final String textoBotao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        child: Center(
          child: Text(
            textoBotao,
            style: botaoGrandeTextStyle,
          ),
        ),
        color: corDoContainerInferior,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: alturaInferior,
      ),
    );
  }
}