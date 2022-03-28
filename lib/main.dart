import 'package:flutter/material.dart';
import 'questionario.dart';
import 'resultado.dart';

main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;
  int _pontuacao = 0;
  final List<Map<String, List<Map<String, String>>>> _perguntas = const [
    {
      'pergunta': [
        {'texto': 'Qual é a sua cor favorita?'}
      ],
      'respostas': [
        {'texto': 'Preto', 'pontuacao': '2'},
        {'texto': 'Vermelho', 'pontuacao': '3'},
        {'texto': 'Verde', 'pontuacao': '4'},
        {'texto': 'Branco', 'pontuacao': '5'},
      ],
    },
    {
      'pergunta': [
        {'texto': 'Qual é o seu animal favorito?'}
      ],
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': '2'},
        {'texto': 'Cobra', 'pontuacao': '3'},
        {'texto': 'Elefante', 'pontuacao': '1'},
        {'texto': 'Leão', 'pontuacao': '5'},
      ],
    },
    {
      'pergunta': [
        {'texto': 'Qual é o seu instrutor favorito?'}
      ],
      'respostas': [
        {'texto': 'Maria', 'pontuacao': '5'},
        {'texto': 'João', 'pontuacao': '2'},
        {'texto': 'Leo', 'pontuacao': '3'},
        {'texto': 'Pedro', 'pontuacao': '4'},
      ],
    }
  ];

  void _responder(int responsta) {
    if (temPerguntaSelecionada) {
      setState(() {
        _pontuacao += int.parse(_perguntas[_perguntaSelecionada]
            ['respostas']![responsta]['pontuacao']!);
        _perguntaSelecionada++;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacao = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                pergunta: _perguntas[_perguntaSelecionada]['pergunta']![0]
                        ['texto']
                    .toString(),
                respostas: _perguntas[_perguntaSelecionada]['respostas']!
                    .map((e) => e['texto'].toString())
                    .toList(),
                quandoResponder: _responder,
              )
            : Resultado(
                pontuacao: _pontuacao,
                quandoReiniciar: _reiniciarQuestionario,
              ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}
