import 'dart:math';

//Clase que me permite calcular el BMI del usuario (Y ofrecer una descripción al respecto)

class Calculadora {
  Calculadora({this.peso, this.alturaA});

  final int peso;
  final int alturaA;
  double _bmi;

  String calcularBMI() {
    _bmi = peso / pow(alturaA / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String obtenerTitulo() {
    if (_bmi < 18) {
      return "Bajo peso";
    } else if (_bmi <= 25 && _bmi >= 18) {
      return "Normal";
    } else {
      return "Sobrepeso";
    }
  }

  String obtenerDesc() {
    if (_bmi < 18) {
      return "Debes alimentarte mejor";
    } else if (_bmi <= 25 && _bmi >= 18) {
      return "Te encuentras en el peso adecuado";
    } else {
      return "Bajale a las papitas, rey";
    }
  }
}
