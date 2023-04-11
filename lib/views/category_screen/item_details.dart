import 'package:e_commerce_app/consts/colors.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/widgets/button.dart';
import 'package:flutter/material.dart';

class Itemdetails extends StatelessWidget {
  final String? title;
  const Itemdetails({Key? key,required this.title}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    print(Colors.purple.value);
    return Scaffold(

backgroundColor: whiteColor,
appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
  title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
  actions: [
    IconButton(onPressed: (){}, icon:const Icon(Icons.share,)),
    IconButton(onPressed: (){}, icon:const Icon(Icons.favorite_border_outlined)),
  ],
),
body: Column(children: [
  Expanded(child: Padding(padding: const EdgeInsets.all(8),
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
     VxSwiper.builder(itemCount: 3, itemBuilder: (context,index){
    return Image.asset(

      imgS7,width: double.infinity,fit: BoxFit.cover,
    );
     }),

     10.heightBox,
     title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),
     10.heightBox,
     VxRating(onRatingUpdate: (value){},
     normalColor: textfieldGrey,
     selectionColor: golden,
     count: 5,
     size: 25,
     stepInt: true,


),
10.heightBox,
"\$3,000".text.color(redColor).fontFamily(bold).size(18)
.make() ,
10.heightBox ,
Row(
  children: [
    Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "Seller".text.white.fontFamily(semibold).size(18).make(),
      5.heightBox,

     "In House Brands".text.fontFamily(semibold).color(darkFontGrey).make()
    ],
      ),
    ),
    const CircleAvatar(
      backgroundColor: Colors.white,
      child: Icon(Icons.message_rounded,color: darkFontGrey,),
    )
  ],


).box.height(60).padding(EdgeInsets.symmetric(horizontal: 16)).color(textfieldGrey).make(),  

 ],
        
    ),
  ),



  )),
  SizedBox(
    width: double.infinity,
    height: 60,
    child: ourButton(
      color: redColor,
      onPress: (){},
      textColor: whiteColor,title: "Add To Cart"
    ),
  )
],


),
    );
  }
}