import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServeHandler {
  Handler get handler {
    final router = Router();

    router.get('/', (Request request) {
      return Response(
        200,
        body: '<h1>Luiz Paulo</h1>',
        headers: {'Content-type': 'text/html'},
      );
    });

    router.get('/ola/mundo/<usuario>', (Request req, String usuario) {
      return Response.ok('Olá Mundo $usuario!');
    });

    router.get('/query', (Request req) {
      String? nome = req.url.queryParameters['nome'];
      String? idade = req.url.queryParameters['idade'];
      return Response.ok('NOME: $nome | IDADE: $idade');
    });

    router.post('/login', (Request req) async {
      var result = await req.readAsString();
      Map json = jsonDecode(result);

      var usuario = json['usuario'];
      var senha = json['senha'];

      if (usuario == 'admin' && senha == '123') {
        return Response.ok(
          jsonEncode({'usuario': usuario, 'senha': senha}),
          headers: {'Content-type': 'application/json'},
        );
      } else {
        return Response.forbidden('Acesso negado!');
      }
    });

    return router;
  }
}
