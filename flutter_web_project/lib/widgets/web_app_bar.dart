// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            "images/logo.png",
            fit: BoxFit.contain,
          ),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
          const SizedBox(
            width: 10,
          ),
          OutlineButton(
            onPressed: () {},
            child: const Text("Cadastrar"),
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          OutlineButton(
            onPressed: () {},
            child: const Text("Cadastrar"),
            color: Colors.orange,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
