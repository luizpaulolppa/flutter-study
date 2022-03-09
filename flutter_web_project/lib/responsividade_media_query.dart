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
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsividade'),
      ),
      body: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
