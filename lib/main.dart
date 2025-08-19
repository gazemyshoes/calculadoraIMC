import 'package:flutter/material.dart';
import '../vista/imc_view.dart';

void main() {
  runApp(const CalcuIMC());
}

class CalcuIMC extends StatelessWidget {
  const CalcuIMC({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const VistaIMC(),
    );
  }
}
