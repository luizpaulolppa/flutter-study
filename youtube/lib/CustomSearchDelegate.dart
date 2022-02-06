import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      List<String> lista = [
        "Android",
        "Android navigation",
        "IOS",
        "Jogos",
      ]
          .where((text) => text.toLowerCase().startsWith(query.toLowerCase()))
          .toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(lista[index]),
            onTap: () {
              close(context, lista[index]);
            },
          );
        },
      );
    } else {
      return Center(
        child: Text("Nenhum resultado para a pesquisa!"),
      );
    }
  }
}
