import '../modelo/imc_model.dart';

class ControladorIMC {
  final ModeloIMC modelo;

  ControladorIMC(this.modelo);

  void actualizarPeso(String valor) {
    modelo.peso = double.tryParse(valor);
  }

  void actualizarAltura(String valor) {
    modelo.altura = double.tryParse(valor);
  }

  void calcular() {
    modelo.calcularIMC();
  }
}