import 'dart:math';

class calories_intake{
  calories_intake({required this.gender, required this.age, required this.height, required this.weight});

  final int gender;
  final int age;
  final double height;
  final double weight;

  double bmr = 0.0;
  String calculateBMR(){
    if(gender == 0){
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    }
    else{
      bmr =447.593 + (9.247  * weight) + (3.098  * height) - (4.330 * age);
    }
    return bmr.toStringAsFixed(3) + "calories";
  }


}