import 'package:flutter/material.dart';
import 'package:my_notes/helper/AnotacaoHelper.dart';
import 'package:my_notes/model/Anotacao.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var db = AnotacaoHelper();
  List<Anotacao> anotacoes = [];
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
    await recuperarAnotacao();
  }

  recuperarAnotacao() async {
    List anotacoesRecuperadas = await db.recuperarAnotacoes();

    List<Anotacao> tempList = [];
    for (var map in anotacoesRecuperadas) {
      tempList.add(Anotacao.fromMap(map));
    }

    setState(() {
      anotacoes = tempList;
    });
  }

  @override
  void initState() {
    super.initState();
    recuperarAnotacao();
  }

  String formatarData(String? dataStr) {
    if (dataStr == null) return "";

    initializeDateFormatting("pt_BR");
    var formatador = DateFormat("y/M/d");
    DateTime dataConvertida = DateTime.parse(dataStr);
    String dataFormatada = formatador.format(dataConvertida);
    return dataFormatada;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas anotações"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: anotacoes.length,
              itemBuilder: (context, index) {
                Anotacao note = anotacoes[index];
                return Card(
                  margin: EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: ListTile(
                    title: Text("${note.titulo}"),
                    subtitle:
                        Text("${formatarData(note.data)} - ${note.descricao}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
