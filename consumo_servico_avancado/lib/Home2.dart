import 'dart:convert';

import 'package:consumo_servico_avancado/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  String _urlBase = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> _recuperarPostagens() async {
    http.Response response = await http.get(Uri.parse(_urlBase + "/posts"));
    var dadosJson = json.decode(response.body);
    List<Post> posts = [];
    for (var post in dadosJson) {
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      posts.add(p);
    }
    return posts;
  }

  void _post() async {
    String corpo = json.encode(
      {"userId": 120, "id": null, "title": "Titulo", "body": "corpo"},
    );
    http.Response response = await http.post(
      Uri.parse(_urlBase + "/posts"),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo,
    );
    print(response.body);
  }

  void _put() async {
    String corpo = json.encode(
      {
        "userId": 121,
        "id": null,
        "title": "Titulo alterado",
        "body": "corpo alterado"
      },
    );
    http.Response response = await http.put(
      Uri.parse(_urlBase + "/posts/2"),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo,
    );
    print(response.body);
  }

  void _patch() async {
    String corpo = json.encode(
      {"userId": 121, "id": null, "title": null, "body": "corpo alterado"},
    );
    http.Response response = await http.patch(
      Uri.parse(_urlBase + "/posts/2"),
      headers: {"Content-type": "application/json; charset=UTF-8"},
      body: corpo,
    );
    print(response.statusCode);
    print(response.body);
  }

  void _delete() async {
    http.Response response = await http.delete(
      Uri.parse(_urlBase + "/posts/2"),
      headers: {"Content-type": "application/json; charset=UTF-8"},
    );
    print(response.body);
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                RaisedButton(
                  child: Text("POST"),
                  onPressed: _post,
                ),
                RaisedButton(
                  child: Text("PUT"),
                  onPressed: _put,
                ),
                RaisedButton(
                  child: Text("PATCH"),
                  onPressed: _patch,
                ),
                RaisedButton(
                  child: Text("DELETE"),
                  onPressed: _delete,
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: _recuperarPostagens(),
                builder: (context, snapshot) {
                  String resultado = "";
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      resultado = "Carregando";
                      break;
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        resultado = "Erro ao carregar os dados...";
                      } else {
                        // resultado = "Lista carregada";

                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            List<Post> posts = snapshot.data!;
                            Post post = posts[index];

                            return ListTile(
                              title: Text(post.title),
                              subtitle: Text(post.body),
                            );
                          },
                        );
                      }
                      break;
                  }
                  return Center(
                    child: Text(resultado),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
