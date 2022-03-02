// import 'package:mobx/mobx.dart';

import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  int contador = 0;

  @action
  incrementar() {
    contador++;
  }

  // var _contador = Observable<int>(0);
  // Action? incrementar;

  // Controller() {
  //   incrementar = Action(_incrementar);
  // }

  // int get contador => _contador.value;
  // set contador(int valor) => _contador.value = valor;

  // _incrementar() {
  //   contador = contador + 1;
  // }
}
