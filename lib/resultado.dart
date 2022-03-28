import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final void Function() quandoReiniciar;

  final int pontuacao;

  const Resultado({
    Key? key,
    required this.quandoReiniciar,
    required this.pontuacao,
  }) : super(key: key);

  String _resultado() {
    return pontuacao < 8
        ? 'Parabéns'
        : pontuacao < 16
            ? 'Você é bom!'
            : pontuacao < 24
                ? 'Incrivél'
                : 'Você é um Jedi!';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(_resultado(), style: const TextStyle(fontSize: 28))),
        TextButton(
          onPressed: quandoReiniciar,
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(color: Colors.blue),
            ),
          ),
          child: const Text('Reiniciar?'),
        ),
      ],
    );
  }
}
