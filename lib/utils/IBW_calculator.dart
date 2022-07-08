import 'dart:math';

class IBW_calculator{
  IBW_calculator({required this.gender, required this.height, required this.weight});

  final int gender;
  final double height;
  final double weight;

  double ibw = 0.0;

  String calculateIBW() {
    if(gender == 0){
      ibw = (height - 100) - ((height - 150) / 4.0);
    }
    else if(gender == 1){
      ibw = (height - 100) - ((height - 150)/2);
    } return ibw.toStringAsFixed(1);

  }

  String get_bmi() {
    if (weight > ibw) {
      return 'You have to lose weight, exercise regularly';
    } else if (weight < ibw) {
      return 'Some how increase your weight';
    } else  {
      return 'Your in prefect weight Champ!!!';
    }
  }




}