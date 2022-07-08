import 'dart:ui';

import 'package:calories_counter/screens/Home_screen.dart';
import 'package:calories_counter/screens/bmi_calc.dart';
import 'package:calories_counter/screens/login_screen.dart';
import 'package:calories_counter/screens/getstaarted_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/cupertino.dart';
import 'package:calories_counter/utils/constants.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

Future<void> main() async {

WidgetsFlutterBinding.ensureInitialized();
await  Firebase.initializeApp();

 runApp(

const MaterialApp(


  debugShowCheckedModeBanner: false,
    home: Home_screen(),
  )
);
}
class Getstartedpage extends StatelessWidget {
  const Getstartedpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = window.physicalSize.width;



    return MaterialApp(
        theme: ThemeData(primaryColor: COLOR_WHITE, textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT, fontFamily: "Montserrat", colorScheme: ColorScheme.fromSwatch().copyWith(secondary: COLOR_DARK_BLUE)),


      
    );
  }
}

