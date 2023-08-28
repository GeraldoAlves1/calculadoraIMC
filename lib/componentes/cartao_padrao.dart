import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartaoPadrao extends StatelessWidget {
  CartaoPadrao({required this.cor, this.filhoCartao, this.aoPressionar});

  final Color cor;
  final Widget? filhoCartao;
  void Function()? aoPressionar;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration:
            BoxDecoration(color: cor, borderRadius: BorderRadius.circular(10)),
        child: filhoCartao,
      ),
    );
  }
}
