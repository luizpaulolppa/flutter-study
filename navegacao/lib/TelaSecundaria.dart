import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {
  // const TelaSecundaria({Key? key}) : super(key: key);

  String valor;

  TelaSecundaria(this.valor);

  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text("Segunda Secundaria! valor passado: ${widget.valor}"),
          ],
        ),
      ),
    );
  }
}
