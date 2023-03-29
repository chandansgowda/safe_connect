import 'package:flutter/material.dart';


class DummyScreen extends StatelessWidget {
  const DummyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sam"),),
      body: const Center(
        child: Text("done"),
      ),
    );
  }
}
