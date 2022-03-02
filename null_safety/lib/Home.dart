import 'dart:math';

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

int? numero = 10;

class _HomeState extends State<Home> {
  //Veriável não pode ser nula
  // String nome = "";
  // int idade = 12;
  // double altura = 1.50;

  //variáveis nulas tem que ser definidas de forma explicita com o operador ''
  // String? complemento;

  //operador (!) -> null assertion operator (operador de afirmação de nulo)
  int resultado = numero!;
  String? nome = "Luiz Paulo";
  test() {
    String resultado = nome ?? "";
    print("total de caracteres: ${resultado.length}");
  }

  /*
  * Como utilizar os operadores ? & !
  */
  test2() {
    List<String> lista1 = ["Morando", "Banana", "Melão"];
    List<String>? lista2;
    List<String?> lista3 = ["Morando", null, "Melão"];

    print("lista1: ${lista1}");
    print("lista2: ${lista2}");
    print("lista3: ${lista3}");

    String valor = lista3.first!;
    // or
    // String? valor = lista3.first;
    print("valor é: ${valor}");

    // Operador (?.) -> null aware operator
    print("Total de itens: ${lista2?.length}");

    Random? random;
    // random = Random();
    print("Número aleatório: ${random?.nextInt(10)}");
  }

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
