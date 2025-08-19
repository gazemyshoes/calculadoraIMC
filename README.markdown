# Calculadora de IMC

Esta es una aplicación móvil desarrollada en **Flutter** con el lenguaje **Dart**, que calcula el **Índice de Masa Corporal (IMC)** basado en el peso (en kg) y la altura (en metros) ingresados por el usuario. La aplicación sigue el patrón **Modelo-Vista-Controlador (MVC)** para una estructura clara y modular.

## Estructura del proyecto

El proyecto está organizado en cuatro archivos principales dentro del directorio `lib/`:

- **`main.dart`**: Punto de entrada de la aplicación. Configura el tema y establece la vista inicial (`VistaIMC`).
- **`imc_model.dart`**: Define el modelo (`ModeloIMC`), que almacena los datos (peso, altura, IMC, clasificación) y contiene la lógica para calcular el IMC y clasificarlo.
- **`imc_controller.dart`**: Define el controlador (`ControladorIMC`), que actúa como intermediario entre la vista y el modelo, manejando las entradas del usuario y desencadenando cálculos.
- **`imc_vista.dart`**: Define la interfaz de usuario (`VistaIMC`) y widgets personalizados (`CampoDeTexto`, `BotonElevado`, `TextoResultado`) para mostrar y capturar datos.

## Funcionamiento

1. **Entrada de datos**: El usuario ingresa su peso (en kg) y altura (en metros, ej. 1.75 para 175 cm) en dos campos de texto.
2. **Cálculo**: Al presionar el botón "Calcular IMC", la vista envía los datos al controlador, que actualiza el modelo y ejecuta el cálculo del IMC usando la fórmula: `IMC = peso / (altura * altura)`.
3. **Clasificación**: El modelo clasifica el IMC en:
   - Bajo peso (< 18.5)
   - Peso normal (18.5 - 24.9)
   - Sobrepeso (25 - 29.9)
   - Obesidad (≥ 30)
4. **Resultados**: La vista muestra el IMC calculado (redondeado a 2 decimales) y la clasificación correspondiente.

## Requisitos

- **Flutter**: Versión compatible instalada (ver `pubspec.yaml`).
- **Dart**: Incluido con Flutter.
- Dependencias: Solo se requiere el paquete `flutter` estándar.

## Instrucciones para ejecutar

1. Clona o crea el proyecto:
   ```bash
   flutter create calculadora_imc
   cd calculadora_imc
   ```
2. Reemplaza los archivos en `lib/` con:
   - `main.dart`
   - `imc_model.dart`
   - `imc_controller.dart`
   - `imc_vista.dart`
3. Asegúrate de que `pubspec.yaml` incluya:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
   ```
4. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

## Notas

- La aplicación usa nombres en español para widgets y clases donde aplica, mejorando la legibilidad.
- La altura debe ingresarse en metros (ej. 1.75 para 175 cm).
- Para personalizaciones (estilos, validaciones adicionales, etc.), modifica los archivos correspondientes.