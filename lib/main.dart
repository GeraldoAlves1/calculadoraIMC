import 'package:app_calculadoraimc/telas/tela_principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraIMC());
}

class CalculadoraIMC extends StatelessWidget {
  const CalculadoraIMC({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData.dark(), home: TelaPrincipal());
  }
}
