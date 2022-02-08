import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerCampo = TextEditingController();
  String _textoSalvo = "Nada salvo!";

  void _salvar() {
    String valorDigitado = _controllerCampo.text;
  }

  void _recuperar() {}

  void _remover() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manipulação de dados"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              _textoSalvo,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite algo",
              ),
              controller: _controllerCampo,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 16,
              ),
              child: Row(
                children: [
                  RaisedButton(
                    onPressed: _salvar,
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: _recuperar,
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Recuperar",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: _recuperar,
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Remover",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
