import 'package:flutter/material.dart';

class ResposividadeMediaQuery extends StatefulWidget {
  const ResposividadeMediaQuery({Key? key}) : super(key: key);

  @override
  State<ResposividadeMediaQuery> createState() =>
      _ResposividadeMediaQueryState();
}

class _ResposividadeMediaQueryState extends State<ResposividadeMediaQuery> {
  @override
  Widget build(BuildContext context) {
    var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;
    var alturaBarraStatus = MediaQuery.of(context).padding.top;
    var AlturaAppBar = AppBar().preferredSize.height;
    var larguraItem = largura / 3;

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsividade'),
      ),
      body: Row(
        children: [
          Container(
            width: larguraItem,
            height: altura - AlturaAppBar - alturaBarraStatus,
            color: Colors.red,
            child: Text("Responsividade"),
          ),
          Container(
            width: larguraItem,
            height: altura - AlturaAppBar - alturaBarraStatus,
            color: Colors.black,
            child: Text("Responsividade"),
          ),
          Container(
            width: larguraItem,
            height: altura - AlturaAppBar - alturaBarraStatus,
            color: Colors.yellow,
            child: Text("Responsividade"),
          ),
        ],
      ),
    );
  }
}
