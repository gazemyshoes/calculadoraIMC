import 'package:flutter/material.dart';
import '../modelo/imc_model.dart';
import '../controlador/imc_controller.dart';

class VistaIMC extends StatefulWidget {
  const VistaIMC({super.key});

  @override
  State<VistaIMC> createState() => _EstadoVistaIMC();
}

class _EstadoVistaIMC extends State<VistaIMC> {
  final modelo = ModeloIMC();
  late final ControladorIMC controlador;
  final controladorPeso = TextEditingController();
  final controladorAltura = TextEditingController();

  @override
  void initState() {
    super.initState();
    controlador = ControladorIMC(modelo);
    controladorPeso.addListener(() {
      controlador.actualizarPeso(controladorPeso.text);
    });
    controladorAltura.addListener(() {
      controlador.actualizarAltura(controladorAltura.text);
    });
  }

  @override
  void dispose() {
    controladorPeso.dispose();
    controladorAltura.dispose();
    super.dispose();
  }

  void _calcularIMC() {
    setState(() {
      controlador.calcular();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CampoDeTexto(
              controlador: controladorPeso,
              etiqueta: 'Peso (kg)',
            ),
            const SizedBox(height: 16.0),
            CampoDeTexto(
              controlador: controladorAltura,
              etiqueta: 'Altura (m)',
            ),
            const SizedBox(height: 16.0),
            BotonElevado(
              onPressed: _calcularIMC,
              texto: 'Calcular IMC',
            ),
            const SizedBox(height: 16.0),
            if (modelo.imc != null)
              TextoResultado(
                texto: 'Tu IMC es: ${modelo.imc!.toStringAsFixed(2)}',
              ),
            if (modelo.clasificacion != null)
              TextoResultado(
                texto: 'Clasificación: ${modelo.clasificacion}',
              ),
          ],
        ),
      ),
    );
  }
}

class CampoDeTexto extends StatelessWidget {
  final TextEditingController controlador;
  final String etiqueta;

  const CampoDeTexto({
    super.key,
    required this.controlador,
    required this.etiqueta,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controlador,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: etiqueta,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

class BotonElevado extends StatelessWidget {
  final VoidCallback onPressed;
  final String texto;

  const BotonElevado({
    super.key,
    required this.onPressed,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(texto),
    );
  }
}

class TextoResultado extends StatelessWidget {
  final String texto;

  const TextoResultado({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 18.0),
    );
  }
}