import 'package:calculadora_costos/inicio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
        title: "Calculadora costos",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title:const Text("Costos de importación"),
            backgroundColor: Colors.blueGrey,
          ),
          body:const Inicio(),
        ));
  }
}
