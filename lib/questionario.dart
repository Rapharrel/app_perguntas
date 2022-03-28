import 'package:flutter/material.dart';
import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final String pergunta;
  final void Function(int) quandoResponder;
  final List<String> respostas;

  const Questionario(
      {Key? key,
      required this.pergunta,
      required this.respostas,
      required this.quandoResponder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(pergunta),
        ...respostas
            .asMap()
            .entries
            .map((t) => Resposta(t.value, () => quandoResponder(t.key)))
            .toList(),
      ],
    );
  }
}
