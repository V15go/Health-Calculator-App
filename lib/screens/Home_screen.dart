import 'package:calories_counter/screens/bfp_calc.dart';
import 'package:calories_counter/screens/bmi_calc.dart';
import 'package:calories_counter/screens/calories_calc.dart';
import 'package:calories_counter/screens/ibw_calc.dart';
import 'package:calories_counter/utils/widget_gap.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/button.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(image:
              DecorationImage(
                  image: AssetImage('assets/images/home_bg.png'),
                  fit: BoxFit.fill

              )),
            ),

            Center(

              child: Container(

                child: Column(
                  children: <Widget>[
                addVerticalSpace(250),
                    button(
                        width: 350,
                        height: 50,

                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> bmi_calc()));
                        },

                        borderRadius: BorderRadius.circular(20),

                        child: Text('Body mass index (BMI)',style: GoogleFonts.acme(textStyle: const TextStyle(
                          fontSize: 24
                        )),)
                    )
                    ,
                    addVerticalSpace(20),
                    button(
                        width: 350,
                        height: 50,

                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ibw_calc()));
                        },

                        borderRadius: BorderRadius.circular(20),

                        child: Text('ideal body weight',style: GoogleFonts.acme(textStyle: const TextStyle(
                            fontSize: 24
                        )),)
                    ),
                    addVerticalSpace(20),
                    button(
                        width: 350,
                        height: 50,

                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> bfp_calc()));
                        },

                        borderRadius: BorderRadius.circular(20),

                        child: Text(' Body Fat Percentage',style: GoogleFonts.acme(textStyle: const TextStyle(
                            fontSize: 24
                        )),)
                    ),
                    addVerticalSpace(20),
                    button(
                        width: 350,
                        height: 50,

                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> calories_calc()));
                        },

                        borderRadius: BorderRadius.circular(20),

                        child: Text('Calorie Calculator',style: GoogleFonts.acme(textStyle: const TextStyle(
                            fontSize: 24
                        )),)
                    ),
                    addVerticalSpace(20),
                    button(
                        width: 350,
                        height: 50,

                        onPressed: (){
                          
                        },

                        borderRadius: BorderRadius.circular(20),

                        child: Text(' Ideal Water Intake',style: GoogleFonts.acme(textStyle: const TextStyle(
                            fontSize: 24
                        )),)
                    ),
                    addVerticalSpace(20),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
