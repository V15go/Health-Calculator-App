import 'package:calories_counter/screens/Home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/blend_mask.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/constants.dart';
import '../utils/widget_gap.dart';
import '../utils/button.dart';

class getstaarted_page extends StatefulWidget {
  const getstaarted_page({Key? key}) : super(key: key);

  @override
  _getstaarted_pageState createState() => _getstaarted_pageState();
}

class _getstaarted_pageState extends State<getstaarted_page> {
  final  _formkey = GlobalKey<FormState>();
  final TextEditingController email_controller = new TextEditingController();
  final TextEditingController password_controller = new TextEditingController();

  
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: email_controller,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return ('Please enter your Email');
        }
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]").hasMatch(value)){
          return ('Enter valid email ID');
        }
        return null;
      },
      onSaved: (value){
        email_controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: password_controller,
      obscureText: true,

      validator: (value) {
        if(value!.isEmpty){
          return 'Password if Empty';
        }
        if(value.length < 6){
          return 'Enter a strong Password';
        }

        return null;
      },
      onSaved: (value){
        password_controller.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
      return SafeArea(
        child: Scaffold(
            body : Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(image:
                    DecorationImage(
                        image: AssetImage('assets/images/sign_up_back.png'),
                        fit: BoxFit.fill

                    )),
                  ),


                  Center(
                      child: SingleChildScrollView(
                          child: Container(

                              child : Padding(
                                  padding: const EdgeInsets.all(32),
                                  child: Form(
                                      key: _formkey,
                                      child: Column(

                                        children: <Widget>[
                                          addVerticalSpace(20),


                                          emailField,
                                          addVerticalSpace(20),

                                          passwordField,
                                          addVerticalSpace(20),
                                          button(
                                              width: 200,
                                              height: 50,

                                              onPressed: (){
                                                signIn(email_controller.toString(), password_controller.toString());

                                              },

                                              borderRadius: BorderRadius.circular(20),

                                              child: Text('Login',style: TextStyle(
                                                  fontSize: 32, fontWeight: FontWeight.bold,
                                                  color: Colors.white
                                              ),)
                                          )
                                        ],
                                      )


                                  )
                              )
                          )))
                ])) );
  }


  //Login Function

void signIn (String email, String password) async{
     if(_formkey.currentState!.validate()){
       await _auth.signInWithEmailAndPassword(email: email, password: password)
           .then((uid) => {
       Fluttertoast.showToast(msg: "Login Successful"),
       Navigator.push(context, MaterialPageRoute(builder: (context)=> Home_screen()))
           }

       ).catchError((e){
         Fluttertoast.showToast(msg: e);

  });
     }
}

}


