import 'package:architecture/core/inject/inject.dart';
import 'package:architecture/layers/presentations/ui/pages/carro_page.dart';
import 'package:flutter/material.dart';

void main() {
  Inject.init();
  runApp(
    MaterialApp(
      home: CarroPage(),
    ),
  );
}
