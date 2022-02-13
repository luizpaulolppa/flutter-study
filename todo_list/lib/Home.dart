import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List tasks = [];
  Map<String, dynamic> lastRemovedTak = {};
  TextEditingController textController = TextEditingController();

  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/data.json");
  }

  void addTask() async {
    String text = textController.text;
    Map<String, dynamic> task = {};
    task["id"] = DateTime.now().millisecondsSinceEpoch;
    task["title"] = text;
    task["isCompleted"] = false;
    setState(() {
      tasks.add(task);
    });
    textController.text = "";
    saveFile();
  }

  void saveFile() async {
    File file = await _getFile();
    String content = json.encode(tasks);
    file.writeAsString(content);
  }

  Future<String> readFile() async {
    try {
      File file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return "";
    }
  }

  void loadTasks() {
    readFile().then((dados) {
      setState(() {
        tasks = json.decode(dados);
      });
    });
  }

  void checkTask(int index, bool isCompleted) {
    setState(() {
      tasks[index]["isCompleted"] = isCompleted;
    });
    saveFile();
  }

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  Widget criarItemLista(BuildContext context, int index) {
    String title = "${tasks[index]["title"]}";
    bool isCompleted = tasks[index]["isCompleted"];
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        setState(() {
          lastRemovedTak = tasks[index];
          tasks.removeAt(index);
        });
        saveFile();

        final snackbar = SnackBar(
          content: Text("Tarefa removida"),
          action: SnackBarAction(
            label: "Desfazer",
            onPressed: () {
              setState(() {
                tasks.insert(index, lastRemovedTak);
              });
              saveFile();
            },
          ),
        );

        Scaffold.of(context).showSnackBar(snackbar);
      },
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: Colors.white,
            )
          ],
        ),
      ),
      child: CheckboxListTile(
        title: Text(title),
        onChanged: (value) {
          checkTask(index, value!);
        },
        value: isCompleted,
      ),
    );
  }

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
                  controller: textController,
                ),
                actions: [
                  FlatButton(
                    child: Text("Cancelar"),
                    onPressed: () => Navigator.pop(context),
                  ),
                  FlatButton(
                    child: Text("Salvar"),
                    onPressed: () {
                      addTask();
                      Navigator.pop(context);
                    },
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
              itemCount: tasks.length,
              itemBuilder: criarItemLista,
            ),
          ),
        ],
      ),
    );
  }
}
