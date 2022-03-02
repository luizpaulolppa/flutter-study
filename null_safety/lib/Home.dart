import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

// class Funcionario {
//   //'late' operador para dizer que o valor será atribuído em um futuro próximo.
//   late double salario;

//   calcular() {
//     salario = 100;
//   }
// }

class _HomeState extends State<Home> {
  //Veriável não pode ser nula
  String nome = "";
  int idade = 12;
  double altura = 1.50;

  //variáveis nulas tem que ser definidas de forma explicita com o operador '?'
  String? complemento;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Null Safety"),
      ),
      body: Container(),
    );
  }
}
