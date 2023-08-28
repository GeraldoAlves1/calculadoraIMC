import 'package:app_calculadoraimc/componentes/botao_inferior.dart';
import 'package:app_calculadoraimc/componentes/cartao_padrao.dart';
import 'package:app_calculadoraimc/constantes.dart';
import 'package:flutter/material.dart';

class TeladeResultados extends StatelessWidget {
  TeladeResultados(
      {required this.interpretacao,
      required this.resultadoIMC,
      required this.resultadoTexto});
  final String resultadoIMC;
  final String resultadoTexto;
  final String interpretacao;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'RESULTADO',
                style: botaoGrandeTelaResultado,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CartaoPadrao(
              cor: corDoCard,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultadoTexto,
                    style: botaoStatusdoResultado,
                  ),
                  Text(
                    resultadoIMC,
                    style: imcTextStyle,
                  ),
                  Text(
                    interpretacao,
                    style: corpoTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BotaoInferior(
            aoPressionar: () {
              Navigator.pop(context);
            },
            textoBotao: 'RECALCULAR',
          )
        ],
      ),
    );
  }
}
