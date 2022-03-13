import 'package:flutter/material.dart';
import 'package:flutter_web_project/widgets/item_produto.dart';
import 'package:flutter_web_project/widgets/mobile_app_bar.dart';
import 'package:flutter_web_project/widgets/web_app_bar.dart';

class LojaVirtual extends StatefulWidget {
  const LojaVirtual({Key? key}) : super(key: key);

  @override
  State<LojaVirtual> createState() => _LojaVirtualState();
}

class _LojaVirtualState extends State<LojaVirtual> {
  ajustarVisualizacao(double larguraTela) {
    int colunas = 2;

    if (larguraTela <= 600) {
      colunas = 2;
    } else if (larguraTela <= 960) {
      colunas = 4;
    } else {
      colunas = 6;
    }

    return colunas;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        var largura = constraint.maxWidth;
        var larguraBarra = AppBar().preferredSize.height;

        getAppBar() {
          return largura < 600
              ? PreferredSize(
                  child: MobileAppBar(),
                  preferredSize: Size(largura, larguraBarra),
                )
              : PreferredSize(
                  child: WebAppBar(),
                  preferredSize: Size(largura, larguraBarra),
                );
        }

        return Scaffold(
          appBar: getAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.count(
              crossAxisCount: ajustarVisualizacao(largura),
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                ItemProduto("Kit Multimídia", "2.500,00", "p1.jpg"),
                ItemProduto("Pneu Goodyear aro 16", "500,00", "p2.jpg"),
                ItemProduto("Samsung 9", "4.400,00", "p3.jpg"),
                ItemProduto("Samsung Edge", "3.400,00", "p4.jpg"),
                ItemProduto("Galaxy 10", "400,00", "p5.jpg"),
                ItemProduto("IPhone 10", "1.900,00", "p6.jpg"),
              ],
            ),
          ),
        );
      },
    );
  }
}
