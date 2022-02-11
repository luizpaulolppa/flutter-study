import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _listaTaredas = ["Estudar", '2', '3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tarefas"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Adicionar Tarefa"),
                content: TextField(
                  decoration: InputDecoration(
                    labelText: "Digite sua terefa",
                  ),
                  onChanged: (text) {
                    print(text);
                  },
                ),
                actions: [
                  FlatButton(
                    child: Text("Cancelar"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  FlatButton(
                    child: Text("Salvar"),
                    onPressed: () {},
                  ),
                ],
              );
            },
          );
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _listaTaredas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${_listaTaredas[index]}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
