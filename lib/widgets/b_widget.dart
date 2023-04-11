import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/material/scaffold.dart';
Widget bwidget({Widget? child}){
  return Container(
    height: 50,
    decoration: const BoxDecoration(image:DecorationImage(image: AssetImage(imgB1),fit:BoxFit.fill)),
    child: child,
  );
   
} 