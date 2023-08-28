import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BotaoArrendondado extends StatelessWidget {
  BotaoArrendondado({required this.icone, required this.aoPressionar});

  final IconData icone;
  void Function() aoPressionar;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icone),
      onPressed: aoPressionar,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 50,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF7E7E7E),
    );
  }
}
