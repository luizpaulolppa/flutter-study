import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controllerCep = TextEditingController();
  String data = "";

  void _recuperarCep() async {
    setState(() {
      data = "";
    });

    String url = "https://viacep.com.br/ws/${controllerCep.text}/json";
    http.Response response;
    response = await http.get(Uri.parse(url));
    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    print(logradouro);
    print(complemento);
    print(bairro);
    print(localidade);

    setState(() {
      data = response.body.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Difite o cep: ex: 99339992",
              ),
              style: TextStyle(
                fontSize: 20,
              ),
              controller: controllerCep,
            ),
            RaisedButton(
              child: Text("Buscar no Via CEP"),
              onPressed: _recuperarCep,
            ),
            Text("Resultado:"),
            Text(data),
          ],
        ),
      ),
    );
  }
}
