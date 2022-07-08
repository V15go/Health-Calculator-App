import 'package:calories_counter/screens/Home_screen.dart';
import 'package:calories_counter/utils/IBW_calculator.dart';
import 'package:flutter/material.dart';

import '../utils/button.dart';
import '../utils/widget_gap.dart';

class ibw_calc extends StatefulWidget {
  const ibw_calc({Key? key}) : super(key: key);

  @override
  _ibw_calcState createState() => _ibw_calcState();
}

class _ibw_calcState extends State<ibw_calc> {

  final  _formkey = GlobalKey<FormState>();

  final TextEditingController height_controller = new TextEditingController();
  final TextEditingController weight_controller = new TextEditingController();
  int curr_ind = 0;

  IBW_calculator? ans;
  String? ibw;
  String? sol;

  @override
  Widget build(BuildContext context) {
    final height = TextFormField(
      autofocus: false,
      controller: height_controller,
      maxLength: 3,
      keyboardType: TextInputType.number,
      validator: (value){
        if(value!.isEmpty){
          return ('Enter the Height');
        }

        return null;
      },
      onSaved: (value){
        height_controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Height : 173 cm",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
    final weight = TextFormField(
      autofocus: false,
      controller: weight_controller,
      maxLength: 3,
      keyboardType: TextInputType.number,
      validator: (value){
        if(value!.isEmpty){
          return ('Enter the weight');
        }

        return null;
      },
      onSaved: (value){
        weight_controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Weight : 53 kg",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        centerTitle: true,
        title: const Text("IBW", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),),
        leading: IconButton(icon: Icon(

          Icons.arrow_back_outlined,
          color: Colors.blue,

        ),
          onPressed: () =>    Navigator.push(context, MaterialPageRoute(builder: (context)=> Home_screen()))

        ),
      ),

      body: SingleChildScrollView(


        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  radioButton("Male", Colors.blue, 0),
                  radioButton("Female", Colors.pink, 1)
                ],
              ),
              addVerticalSpace(20),
              height,
              addVerticalSpace(20),
              weight,
              addVerticalSpace(20),
              Center(
                child:    button(
                    width: MediaQuery.of(context).size.width/2,
                    height: 50,

                    onPressed: (){
                      double height = double.parse(height_controller.text);
                      double weight = double.parse(weight_controller.text);
                      ans = IBW_calculator(gender: curr_ind,height: height, weight: weight);


                      setState(() {
                        ibw = ans?.calculateIBW();
                        sol = ans?.get_bmi();


                      });


                    },

                    borderRadius: BorderRadius.circular(20),

                    child: Text('Calculate BMI',style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),)
                ),
              ),
              addVerticalSpace(15),
              Container(
                  width: double.infinity,
                  child: Text("Your BMI is :",textAlign: TextAlign.center, style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),)
              ),
              addVerticalSpace(20),
              Container(
                  width: double.infinity,
                  child: Text("$ibw",textAlign: TextAlign.center, style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),)
              ),

              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  child: Text("$sol",textAlign: TextAlign.center, style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),)
              ),


            ],
          ),
        ),
      ),

    );
  }

  void changeind(int ind ){
    setState(() {
      curr_ind = ind;
    });
  }

  Widget radioButton(String value, Color color, int ind ){
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal:12 ),
        height: 80.0,
        child: MaterialButton(

          color: curr_ind == ind ? color : Colors.grey,
          onPressed: () {
            changeind(ind);
          },
          child: Text(value,style: TextStyle(
              color:  Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0)
          ),

        ),
      ),
    );
  }
}
