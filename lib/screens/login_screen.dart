import 'package:adobe_xd/blend_mask.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:calories_counter/screens/getstaarted_page.dart';
import 'package:calories_counter/screens/sign_up_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import '../utils/constants.dart';
import '../utils/widget_gap.dart';
import '../utils/button.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  _login_screenState createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {

  final formkey = GlobalKey<FormState>();






  @override
  Widget build(BuildContext context) {

    final ThemeData themeData = Theme.of(context);



    return Stack(
      children: <Widget>[

        Container(
          decoration: BoxDecoration(image:
          DecorationImage(
              image: AssetImage('assets/images/get_started.png'),
              fit: BoxFit.cover

          )),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            addVerticalSpace(250),
            Container(
              height: 150,
              child: Center(
                child: Text("Welcome", style: TextStyle(fontSize: 32, color: Colors.white),),
              ),



            ),


            button(
                width: 200,
                height: 50,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> getstaarted_page()));
                },
                borderRadius: BorderRadius.circular(20),
                child: Text('LOGIN',style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold,
                    color: Colors.white
                ),)
            ),

            addVerticalSpace(20),

            button(
                width: 200,
                height: 50,

                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> sign_up_page()));
                },

                borderRadius: BorderRadius.circular(20),

                child: Text('SIGN IN',style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.bold,
                    color: Colors.white
                ),)
            )
            ],
        )
      ],
    );
  }
}

class button_deign extends StatelessWidget {

  final String input_text;
  button_deign(this.input_text);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      height: 50,
      width: 200,



      child: ElevatedButton(

        onPressed: (){},
        child: Text(input_text, style: TextStyle(
            color: COLOR_BLACK, fontSize: 20, fontWeight: FontWeight.w400
        )),
      ),
    );
  }
}

