import 'package:e_commerce_app/consts/consts.dart';
import 'package:flutter/material.dart';

class cartScreen extends StatelessWidget {
  const cartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
     child: "cart is empty".text.fontFamily(bold).make()
    );
  }
}