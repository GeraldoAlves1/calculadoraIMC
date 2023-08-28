import 'package:app_calculadoraimc/componentes/botao_arredondado.dart';
import 'package:app_calculadoraimc/componentes/botao_inferior.dart';
import 'package:app_calculadoraimc/componentes/cartao_padrao.dart';
import 'package:app_calculadoraimc/componentes/conteudo_icone.dart';
import 'package:app_calculadoraimc/constantes.dart';
import 'package:app_calculadoraimc/telas/telas_resultados.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../calculadora_imc.dart';

enum Sexo {
  masculino,
  feminino,
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Sexo? sexoSelecionado;
  int altura = 180;
  int peso = 60;
  int idade = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Calculadora IMC')),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  //cartão masculino
                  child: CartaoPadrao(
                aoPressionar: () {
                  setState(() {
                    sexoSelecionado = Sexo.masculino;
                  });
                },
                cor: sexoSelecionado == Sexo.masculino
                    ? corDoCard
                    : corInativadoCartao,
                filhoCartao: Iconesdesexo(
                  iconesDoApp: FontAwesomeIcons.mars,
                  textoDosIcones: 'MASCULINO',
                ),
              )),
              Expanded(
                  //cartão feminino
                  child: CartaoPadrao(
                aoPressionar: () {
                  setState(() {
                    sexoSelecionado = Sexo.feminino;
                  });
                },
                cor: sexoSelecionado == Sexo.feminino
                    ? corDoCard
                    : corInativadoCartao,
                filhoCartao: Iconesdesexo(
                  iconesDoApp: FontAwesomeIcons.venus,
                  textoDosIcones: 'FEMININO',
                ),
              ))
            ],
          )),
          Expanded(
              child: CartaoPadrao(
            cor: corDoCard,
            filhoCartao: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ALTURA',
                  style: styleDosIcones,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(altura.toString(), style: styleDosNumerosDosCartoes),
                    Text(
                      'cm',
                      style: styleDosIcones,
                    ),
                  ],
                ),
                Slider(
                    value: altura.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: corDoContainerInferior,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double novoValor) {
                      setState(() {
                        altura = novoValor.round();
                      });
                    })
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: CartaoPadrao(
                cor: corDoCard,
                filhoCartao: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Peso',
                      style: styleDosIcones,
                    ),
                    Text(
                      peso.toString(),
                      style: styleDosNumerosDosCartoes,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BotaoArrendondado(
                          icone: FontAwesomeIcons.minus,
                          aoPressionar: () {
                            setState(() {
                              peso--;
                              if (peso <= 0) {
                                peso = 0;
                              }
                            });
                          },
                        ),
                        BotaoArrendondado(
                          icone: FontAwesomeIcons.plus,
                          aoPressionar: () {
                            setState(() {
                              peso++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: CartaoPadrao(
                cor: corDoCard,
                filhoCartao: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Idade',
                      style: styleDosIcones,
                    ),
                    Text(
                      idade.toString(),
                      style: styleDosNumerosDosCartoes,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BotaoArrendondado(
                          icone: FontAwesomeIcons.minus,
                          aoPressionar: () {
                            setState(() {
                              idade--;
                              if (idade <= 0) {
                                idade = 0;
                              }
                            });
                          },
                        ),
                        BotaoArrendondado(
                          icone: FontAwesomeIcons.plus,
                          aoPressionar: () {
                            setState(() {
                              idade++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ],
          )),
          BotaoInferior(
            textoBotao: 'CALCULAR',
            aoPressionar: () {
              CalculadoraIMC calc = CalculadoraIMC(
                peso: peso,
                altura: altura,
              );
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeladeResultados(
                          interpretacao: calc.obterInterpretacao(),
                          resultadoIMC: calc.calcularIMC(),
                          resultadoTexto: calc.obterResultado(),
                          )));
            },
          )
        ],
      ),
    );
  }
}
