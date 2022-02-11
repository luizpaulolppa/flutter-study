import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FloatingActionButton"),
        backgroundColor: Colors.black,
      ),
      body: Text("Conteudo"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("BP");
        },
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 20,
        child: const Icon(
          Icons.add,
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(),
    );
  }
}
