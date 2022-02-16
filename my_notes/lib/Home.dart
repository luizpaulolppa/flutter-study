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
  String textoSalvarAtualizar = "";

  showTelaCadastro(Anotacao? anotacao) {
    if (anotacao == null) {
      tituloController.text = "";
      descricaoController.text = "";
      setState(() {
        textoSalvarAtualizar = "Salvar";
      });
    } else {
      tituloController.text = anotacao.titulo!;
      descricaoController.text = anotacao.descricao!;
      setState(() {
        textoSalvarAtualizar = "Atualizar";
      });
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("$textoSalvarAtualizar anotação"),
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
                salvarAnotacao(anotacao);
                Navigator.pop(context);
              },
              child: Text(textoSalvarAtualizar),
            ),
          ],
        );
      },
    );
  }

  salvarAnotacao(Anotacao? anotacaoSelecionada) async {
    String titulo = tituloController.text;
    String descricao = descricaoController.text;
    String dateNow = DateTime.now().toString();

    if (anotacaoSelecionada == null) {
      Anotacao anotacao = Anotacao(titulo, descricao, dateNow);
      await db.salvarAnotacao(anotacao);
    } else {
      anotacaoSelecionada.titulo = titulo;
      anotacaoSelecionada.descricao = descricao;
      anotacaoSelecionada.data = dateNow;
      await db.atualizarAnotacao(anotacaoSelecionada);
    }

    await recuperarAnotacoes();
  }

  recuperarAnotacoes() async {
    List anotacoesRecuperadas = await db.recuperarAnotacoes();

    List<Anotacao> tempList = [];
    for (var map in anotacoesRecuperadas) {
      tempList.add(Anotacao.fromMap(map));
    }

    setState(() {
      anotacoes = tempList;
    });
  }

  removerAnotacao(int anotacaoId) async {
    await db.removerAnotacao(anotacaoId);
    await recuperarAnotacoes();
  }

  @override
  void initState() {
    super.initState();
    recuperarAnotacoes();
  }

  String formatarData(String? dataStr) {
    if (dataStr == null) return "";

    initializeDateFormatting("pt_BR");
    var formatador = DateFormat("dd/MM/yyyy");
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showTelaCadastro(note);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            removerAnotacao(note.id!);
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Icon(
                              Icons.remove_circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
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
          showTelaCadastro(null);
        },
      ),
    );
  }
}
