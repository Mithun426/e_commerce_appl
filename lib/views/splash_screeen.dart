 import 'package:e_commerce_app/consts/colors.dart';
import 'package:e_commerce_app/consts/strings.dart';
import 'package:e_commerce_app/views/auth_screen/home_screen.dart';
import 'package:e_commerce_app/views/auth_screen/login_screen.dart';
import 'package:e_commerce_app/widgets/app_logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../consts/consts.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
 changeScreen(){
  Future.delayed(Duration(seconds: 3 ),(){
    //Get.to(()=> const loginscreen()
    auth.authStateChanges().listen((User? user ) {
      if(user == null && mounted){
        Get.to(()=> const loginscreen());
      }else {
        Get.to(()=> const Homescreen());
      }

     });
  } );

  }


 
 @override
 void initState(){
  changeScreen();
  super.initState();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body:Center(
        child: Column(
          
          children: [
            SizedBox(height: 220,),
          Center(
            
            child: Container(
              
              child: applogo(),
            ),
          ),
          SizedBox(height: 15,),
          appname.text.fontFamily(bold).size(22).white.make(),
          SizedBox(height: 10,),
          appversion.text.white.make(),
          Spacer(),
          credits.text.white.fontFamily(semibold).make(),
          30.heightBox,

          ],
          
        ),
      )
    );
  }
}