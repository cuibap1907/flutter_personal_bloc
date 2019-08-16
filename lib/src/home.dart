import 'package:flutter/material.dart';

class HomeState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Welcome to Home page",
        style: TextStyle(color: Colors.yellow)),
      ),
    );
  }
}