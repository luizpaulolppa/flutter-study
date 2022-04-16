import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf.dart';

class CustomServer {
  Future<void> initialize(Handler handler) async {
    String address = "localhost";
    int port = 8080;

    await shelf_io.serve(handler, address, port);
    print("Servidor iniciado -> http://$address:$port");
  }
}
