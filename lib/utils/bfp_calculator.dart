import 'dart:math';

import 'package:calories_counter/utils/bmi_calculator.dart';


class bfp_calculator{


  bfp_calculator({required this.gender, required this.age, required this.height, required this.weight});

  final int gender;
  final int age;
  final double height;
  final double weight;

  double bfp = 0.0;


  String calculatebfp() {
    double bmi = double.parse(bmi_calculator(height: height, weight: weight).calculateBMI());

    if(gender == 1){
      bfp = (1.20*bmi) + (0.23* age) - 5.4;
    }
    else if(gender == 0){
      bfp = (1.20*bmi) + (0.23* age) - 16.2;

    }    return bfp.toStringAsFixed(2)+"%";

  }

  String get_process() {
    if(gender == 0) {
      if (bfp >= 25) {
        return 'You have a higher than normal body weight. Exercise needed.\n';
      }
      else {
        return 'Great your body fat percentage is cool\n';
      }
    }
    else{
      if (bfp >= 31) {
        return 'You have a higher than normal body weight. Exercise needed.\n';
      }
      else {
        return 'Great your body fat percentage is cool\n';
      }

  }
  }


}