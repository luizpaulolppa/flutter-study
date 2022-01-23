import 'package:flutter/material.dart';

class EntradaSlider extends StatefulWidget {
  const EntradaSlider({Key? key}) : super(key: key);

  @override
  _EntradaSliderState createState() => _EntradaSliderState();
}

class _EntradaSliderState extends State<EntradaSlider> {
  double _valor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              child: Text(
                _valor.toString(),
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Slider(
              value: _valor,
              min: 0,
              max: 10,
              label: "Valor selecionado",
              divisions: 10,
              onChanged: (double? newValor) {
                setState(() {
                  _valor = newValor!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
