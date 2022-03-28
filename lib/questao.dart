import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String _questao;

  const Questao(this._questao, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        _questao,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
