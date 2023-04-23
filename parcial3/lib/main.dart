import 'package:flutter/material.dart';
import 'package:parcial3/principal.dart';



void main() {
  runApp(const ApiJuegos());
  //https://www.freetogame.com/api/games
}

class ApiJuegos extends StatefulWidget {
  const ApiJuegos({super.key});

  @override
  State<ApiJuegos> createState() => _ApiJuegosState();
}

class _ApiJuegosState extends State<ApiJuegos> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: principal(),
    );
  }

  
}
