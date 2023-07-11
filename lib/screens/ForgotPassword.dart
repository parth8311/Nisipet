import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ForgotPassword extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  ForgotPassword();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            color: Color(0xFFffb247),),
        ),
        // Titile of the navigationBar
        title: Text(
          'Forgot Password',
          style: TextStyle(
              color: Color(0xFFffb247)
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        /*decoration: BoxDecoration(
          // Back Ground Color for Gradient
            gradient: LinearGradient(
                begin:  Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Color(0x66ffb247),
                  Color(0x99ffb247),
                ]
            )
        ),*/
        child: CustomPaint(
          size: Size(size.width,size.height),
          painter: Curved(),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('                ENTER YOUR EMAIL AND WE WILL SEND THE RESET PASSWORD LINK TO YOUR REGISTER EMAIL',
                  style: TextStyle(color: Color(0xFFffb247),
                    fontSize: 11,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        labelText: "Enter your Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  color: Color(0xFFffb247),
                  onPressed: () async{
                    await FirebaseAuth.instance.sendPasswordResetEmail(email: controller.text).then((value) {
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(title: '')));
                    });
                  },child: Padding(
                  //padding: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.fromLTRB(80,15,80,15),
                  child: Text('Reset Password',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),)
              ],
            ),
          ),
        ),
      ),
    );
  }

}