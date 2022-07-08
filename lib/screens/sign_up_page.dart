// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:adobe_xd/blend_mask.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:calories_counter/models/usermodel.dart';
import 'package:calories_counter/models/usermodel.dart';
import 'package:calories_counter/screens/Home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe

import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/usermodel.dart';
import '../models/usermodel.dart';
import '../utils/constants.dart';
import '../utils/widget_gap.dart';
import '../utils/button.dart';

class sign_up_page extends StatefulWidget {
  const sign_up_page({Key? key}) : super(key: key);

  @override
  _sign_up_pageState createState() => _sign_up_pageState();
}

class _sign_up_pageState extends State<sign_up_page> {

  final _auth = FirebaseAuth.instance;
  final usermodel userm = usermodel();
  final  _formkey = GlobalKey<FormState>();
  final TextEditingController email_controller = new TextEditingController();
  final TextEditingController password_controller = new TextEditingController();
  final TextEditingController name_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      autofocus: false,
      controller: name_controller,
      keyboardType: TextInputType.text,
      validator: (value) {
        if(value!.isEmpty){
          return ('Please enter your name');
        }

        return null;
      },
      onSaved: (value){
        name_controller.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail_sharp),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );


    final emailField = TextFormField(
      autofocus: false,
      controller: email_controller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
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
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[

                   addVerticalSpace(20),
                  nameField,
                   addVerticalSpace(20),



                   emailField,
                   addVerticalSpace(20),

                   passwordField,
                   addVerticalSpace(20),
                   button(
                       width: 200,
                       height: 50,

                       onPressed: (){
                         signup(email_controller.text, password_controller.text);

                       },

                       borderRadius: BorderRadius.circular(20),

                       child: Text('SIGN IN',style: TextStyle(
                           fontSize: 32, fontWeight: FontWeight.bold,
                           color: Colors.white
                       ),)
                   )
                 ],
               ),
             )
             ),
           ),
         ),
        )

        ],
      ),
      ) );


  }

  void signup(String email, String password) async{
    if(_formkey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            posttofirestore()
      }).catchError((e)
          {
            Fluttertoast.showToast(msg: e!.message);
          }

      );

    }
  }

  posttofirestore() async
  {
   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
   User? user = _auth.currentUser;

   usermodel userm = usermodel();


   userm.name = name_controller.text;


  userm.email = user!.email;
  userm.uid = user.uid;
  
  await firebaseFirestore.collection('Users')
   .doc(user.uid).set(userm.toMap());
  
  Fluttertoast.showToast(msg: "Account created Successfully");
   Navigator.push(context, MaterialPageRoute(builder: (context)=> Home_screen()));






  }





}
