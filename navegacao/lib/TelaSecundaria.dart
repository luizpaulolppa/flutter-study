import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {
  // const TelaSecundaria({Key? key}) : super(key: key);

  // String valor;

  // TelaSecundaria(this.valor);
  TelaSecundaria();

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
            Text("Tela Secundaria!"),
            RaisedButton(
              child: Text("Ir para tela inicial"),
              onPressed: () {
                // Navigator.pushNamed(context, "/");
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
