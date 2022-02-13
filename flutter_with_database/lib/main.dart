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
    // print("Open: " + db.isOpen.toString());
    return db;
  }

  Future<int> addUser(String nome, int idade) async {
    Database database = await getDatabase();
    Map<String, dynamic> dados = {
      "name": nome,
      "idade": idade,
    };
    int id = await database.insert("usuarios", dados);
    print("==> id salvo: " + id.toString());
    return id;
  }

  void listUsers() async {
    Database database = await getDatabase();
    String sql = "SELECT * FROM usuarios";
    List<Map<String, Object?>> data = await database.rawQuery(sql);
    for (var usuario in data) {
      print(usuario);
    }
  }

  void getUserById(int id) async {
    Database database = await getDatabase();
    String sql = "SELECT * FROM usuarios";
    List usuarios = await database.query(
      "usuarios",
      columns: ["id", "name", "idade"],
      where: "id = ?",
      whereArgs: [id],
    );
    for (var usuario in usuarios) {
      print(usuario);
    }
  }

  void deleteUserById(int id) async {
    Database database = await getDatabase();
    String sql = "SELECT * FROM usuarios";
    await database.delete(
      "usuarios",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  void clearUsers() async {
    Database database = await getDatabase();
    await database.delete(
      "usuarios",
    );
  }

  void updateUserById(int id) async {
    Database database = await getDatabase();

    Map<String, dynamic> dados = {
      "name": "Sei lá",
      "idade": 33,
    };

    int retorno = await database.update(
      "usuarios",
      dados,
      where: "id = ?",
      whereArgs: [id],
    );

    print("Quantidade de usuários atualizados: " + retorno.toString());
  }

  void init() async {
    print("===> INIT <===");
    clearUsers();

    int anaId = await addUser("Ana Carla Pilegi", 25);
    int luizId = await addUser("Luiz Paulo Pilegi", 27);
    // await addUser("Carlos Roberto", 50);
    // await addUser("Rosemere Pilegi", 50);

    // print("===> Listando usuários");
    // listUsers();

    // print("===> Procurando Ana");
    // getUserById(anaId);
    // print("===> Procurando Luiz");
    // getUserById(luizId);

    // print("===> Deletando Ana");
    // deleteUserById(anaId);
    // print("===> Deletando Luiz");
    // deleteUserById(luizId);

    print("===> Listando usuários");
    listUsers();

    updateUserById(luizId);

    print("===> Listando usuários");
    listUsers();
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Container();
  }
}
