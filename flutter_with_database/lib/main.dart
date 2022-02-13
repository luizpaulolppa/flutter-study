import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Database"),
        ),
        body: const Home(),
      ),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Database> getDatabase() async {
    final caminhoDatabase = await getDatabasesPath();
    final localDB = join(caminhoDatabase, "banco.db");
    var db = await openDatabase(
      localDB,
      version: 1,
      onCreate: (db, bdCurrentVersion) {
        String sql =
            "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, idade INTEGER)";
        db.execute(sql);
      },
    );
    print("Open: " + db.isOpen.toString());
    return db;
  }

  void save() async {
    Database database = await getDatabase();
    Map<String, dynamic> dados = {
      "name": "Paulo",
      "idade": 32,
    };
    int id = await database.insert("usuarios", dados);
    print("ID salvo: " + id.toString());
  }

  void listUsers() async {
    Database database = await getDatabase();
    String sql = "SELECT * FROM usuarios";
    List<Map<String, Object?>> data = await database.rawQuery(sql);
    for (var usuario in data) {
      print(usuario);
    }
  }

  @override
  Widget build(BuildContext context) {
    // getDatabase();
    // save();
    listUsers();
    return Container();
  }
}
