import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Screentest extends StatelessWidget {
  const Screentest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text("welcome ")),
      ),
      body: Center(
          child: Text(
        "Welcome ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.black,
        ),
      )),
    );
  }
}
