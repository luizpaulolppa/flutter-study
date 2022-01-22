import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    "Enfrente os problemas e leve a melhor!",
    "Os presentes de cada dia",
    "Dê mais atenção ao que você tem de bom na sua vida",
    "Não se exija demais",
    "Um passo por dia",
    "Para chegar ao topo, o que importa é começar!",
    "De nada adianta ter sonhos, se você não se empenhar em correr atrás",
    "Preste atenção nas oportunidades que estão à sua frente!",
    "Positividade para começar o dia é colocar a sua fé em prática",
    "Acredite no poder da sua luz",
    "Não deixe nada nem ninguém estragar o seu bom humor",
    "O que interessa é se levantar. Os tombos fazem parte!",
    "Ontem já passou, é hora de planejar o futuro",
    "Você pode não ter o melhor do mundo, mas tem muito pelo que agradecer!",
    "Não deixe sua felicidade nas mãos de ninguém!",
  ];

  var _fraseGerada = "Clique aqui para gerar uma frase!";

  void _gerarFrase() {
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          // width: double.infinity,
          decoration: BoxDecoration(
              // border: Border.all(
              //   width: 3,
              //   color: Colors.amber,
              // ),
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),
              Text(
                _fraseGerada,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              RaisedButton(
                onPressed: _gerarFrase,
                color: Colors.green,
                child: Text(
                  "Nova frase",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
