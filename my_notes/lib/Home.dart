import 'package:flutter/material.dart';
import 'package:my_notes/helper/AnotacaoHelper.dart';
import 'package:my_notes/model/Anotacao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var db = AnotacaoHelper();
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  showTelaCadastro() {
    tituloController.text = "";
    descricaoController.text = "";
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Adicionar anotação"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: tituloController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Título",
                  hintText: "Digite um título",
                ),
              ),
              TextField(
                controller: descricaoController,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: "Descrição",
                  hintText: "Digite uma descrição",
                ),
              ),
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            FlatButton(
              onPressed: () {
                salvarAnotacao();
                Navigator.pop(context);
              },
              child: const Text("Salvar"),
            ),
          ],
        );
      },
    );
  }

  salvarAnotacao() async {
    String titulo = tituloController.text;
    String descricao = descricaoController.text;
    Anotacao anotacao = Anotacao(
      titulo,
      descricao,
      DateTime.now().toString(),
    );
    int resultado = await db.salvarAnotacao(anotacao);
    print(resultado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas anotações"),
        backgroundColor: Colors.green,
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () {
          showTelaCadastro();
        },
      ),
    );
  }
}
