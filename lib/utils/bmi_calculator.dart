import 'package:calories_counter/screens/bmi_calc.dart';
import 'dart:math';

class bmi_calculator{

  bmi_calculator({required this.height, required this.weight});
  final double height;
  final double weight;

  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String get_bmi() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String get_process() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Exercise needed.\n';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Great!\n ';
    } else {
      return 'You have a lower than normal body weight.You should eat more.\n';
    }
  }

}