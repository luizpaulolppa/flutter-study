import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Map> _recuperarPreco() async {
    String url = "http://blockchain.info/ticker";
    http.Response response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: _recuperarPreco(),
      builder: (context, snapshot) {
        String resultado = "";
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            resultado = "Carregando";
            break;
          case ConnectionState.waiting:
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasError) {
              resultado = "Erro ao carregar os dados...";
            } else {
              double valor = snapshot.data!["BRL"]["buy"];
              resultado = "Reaco do BTC: " + valor.toString();
            }
            break;
        }
        return Center(
          child: Text(resultado),
        );
      },
    );
  }
}
