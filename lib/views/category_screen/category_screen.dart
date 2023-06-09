import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:e_commerce_app/views/category_screen/category_detail.dart';
import 'package:e_commerce_app/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(productcontroller());
    return bgwidget(
      child: Scaffold(
        appBar: AppBar(
          
        title: categories.text.fontFamily(bold).white.make(),

        ),
        body: Container(
      padding:EdgeInsets.all(12) ,
      child: GridView.builder(shrinkWrap: true,itemCount: 9
        ,gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200 ) , itemBuilder: (context,index){

         return Column(
          
             children: [
              Image.asset(categoryimagelist[index],height: 150,width: 200,fit: BoxFit.cover,),
              10.heightBox,
              categorylist[index].text.color(darkFontGrey).align(TextAlign.center).make()
             ],
         ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(()
         
          {

             controller.getSubCategories(categorylist[index]);

          Get.to(()=>Categorydetails(title:categorylist[index] ));
         });
      }),

        ),
      )
   
    );
  }
}