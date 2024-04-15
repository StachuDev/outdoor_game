import 'package:flutter/material.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("O autorze:"),
      ),
      body: const Center(
        child: Text("Stanisław Olszak"),
      ),
    );
  }
}
