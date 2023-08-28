import 'dart:math';

class CalculadoraIMC {
  CalculadoraIMC({required this.altura, required this.peso, this.imc});
  final int altura;
  final int peso;
  final double? imc;

  String calcularIMC() {
    double imc = peso / pow(altura / 100, 2);
    return imc.toStringAsFixed(1);
  }

  String obterResultado() {
    double imc = peso / pow(altura / 100, 2);
    if (imc >= 25.0) {
      return 'ACIMA DO PESO';
    } else if (imc > 18.5) {
      return 'NORMAL';
    } else {
      return 'ABAIXO DO PESO';
    }
  }

  String obterInterpretacao() {
    double imc = peso / pow(altura / 100, 2);
    if (imc >= 25.0) {
      return 'Você está acima do peso ideal. Cuidado com os riscos à sua saúde';
    } else if (imc > 18.5) {
      return 'Você está no peso ideal, excelente!';
    } else {
      return 'Você está abaixo do peso ideal. Tente melhorar sua alimentação.';
    }
  }
}
