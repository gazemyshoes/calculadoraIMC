class ModeloIMC {
  double? peso;
  double? altura;
  double? imc;
  String? clasificacion;

  void calcularIMC() {
    if (peso != null && altura != null && altura! > 0) {
      imc = peso! / (altura! * altura!);
      clasificacion = _determinarClasificacion(imc!);
    } else {
      imc = null;
      clasificacion = 'Por favor, ingrese valores válidos.';
    }
  }

  String _determinarClasificacion(double imc) {
    if (imc < 18.5) return 'Bajo peso';
    if (imc >= 18.5 && imc < 24.9) return 'Peso normal';
    if (imc >= 25 && imc < 29.9) return 'Sobrepeso';
    return 'Obesidad';
  }
}