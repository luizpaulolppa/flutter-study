import 'package:my_notes/model/Anotacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AnotacaoHelper {
  static final String nomeTabela = "anotacoes";
  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();
  Database? _db;

  factory AnotacaoHelper() {
    return _anotacaoHelper;
  }

  // AnotacaoHelper._internal();
  AnotacaoHelper._internal() {}

  get db async {
    if (_db != null) {
      return _db;
    } else {
      return inicializarDB();
    }
  }

  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE $nomeTabela"
        " ("
        "  id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "  titulo VARCHAR,"
        "  descricao TEXT,"
        "  data DATETIME"
        " )";
    await db.execute(sql);
  }

  inicializarDB() async {
    final caminhoDB = await getDatabasesPath();
    final localDB = join(caminhoDB, "notesDB.db");
    var db = await openDatabase(
      localDB,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  Future<int> salvarAnotacao(Anotacao anotacao) async {
    Database database = await db;
    int id = await database.insert(nomeTabela, anotacao.toMap());
    return id;
  }

  Future<int> atualizarAnotacao(Anotacao anotacao) async {
    Database database = await db;
    int id = await database.update(
      nomeTabela,
      anotacao.toMap(),
      where: "id = ?",
      whereArgs: [anotacao.id],
    );
    return id;
  }

  removerAnotacao(int anotacaoId) async {
    Database database = await db;
    await database.delete(
      nomeTabela,
      where: "id = ?",
      whereArgs: [anotacaoId],
    );
  }

  recuperarAnotacoes() async {
    Database bancoDados = await db;
    String sql = "SELECT * FROM $nomeTabela ORDER BY data DESC";
    List anotacoes = await bancoDados.rawQuery(sql);
    return anotacoes;
  }
}
