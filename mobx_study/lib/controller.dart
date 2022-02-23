import 'package:mobx/mobx.dart';

class Controller {
  var _contador = Observable<int>(0);
  Action? incrementar;

  Controller() {
    incrementar = Action(_incrementar);
  }

  int get contador => _contador.value;
  set contador(int valor) => _contador.value = valor;

  _incrementar() {
    contador = contador + 1;
  }
}
