import 'package:mobx/mobx.dart';

class Controller {
  var contador = Observable<int>(0);
  Action? incrementar;

  Controller() {
    incrementar = Action(_incrementar);
  }

  _incrementar() {
    contador.value = contador.value + 1;
  }
}
