import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void recuperarDados() async {
    final caminhoDatabase = await getDatabasesPath();
    final localDB = join(caminhoDatabase, "banco.db");
    var retorno = await openDatabase(
      localDB,
      version: 1,
      onCreate: (db, bdCurrentVersion) {
        String sql =
            "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, idade INTEGER)";
        db.execute(sql);
      },
    );
    print("Open: " + retorno.isOpen.toString());
  }

  @override
  Widget build(BuildContext context) {
    recuperarDados();
    return Container();
  }
}
