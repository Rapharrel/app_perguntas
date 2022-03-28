import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String _resposta;
  final void Function() _onPressed;

  const Resposta(this._resposta, this._onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          textStyle: MaterialStateProperty.all(
            const TextStyle(color: Colors.white),
          )),
      child: Text(_resposta),
      onPressed: _onPressed,
    );
  }
}
