import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controller/product_controller.dart';
import 'package:e_commerce_app/views/category_screen/item_details.dart';
import 'package:e_commerce_app/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Categorydetails extends StatelessWidget {
  final String? title;
  const Categorydetails({Key? key ,required this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<productcontroller>();
    return bgwidget(
      child: Scaffold(
       
        appBar: AppBar(
          title:title!.text.fontFamily(bold).white.make(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          
          

        ),
        body:Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
               child: Row(
                children:List.generate(
                  
                  
                  controller.subcat.length, (index) => "${controller.subcat[index]}".text.size(12).fontFamily(semibold).color(darkFontGrey).makeCentered().box.white.rounded.size(120, 60).margin(EdgeInsets.symmetric(horizontal:4 )).make()),
               ),
             ),


             15.heightBox,
            Expanded(child: Container(
              color: lightGrey,
              child: GridView.builder(physics: const BouncingScrollPhysics(),shrinkWrap: true,itemCount: 6 
        ,gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,mainAxisExtent: 250,mainAxisSpacing: 8,crossAxisSpacing: 8) , itemBuilder: (context,index){
        return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Image.asset(imgP2,width: 200,fit: BoxFit.cover,height: 150,),
                    
                            "Laptop".text.fontFamily(semibold).color(darkFontGrey).make(),
                            10.heightBox,
                            "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                          ],
                    
                    
                        ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.outerShadowSm.padding(EdgeInsets.all(12)).make().onTap(() {Get.to(()=>Itemdetails(title: "Dummy item")); });
        }
            )
            )

            )

            ],
          ),
        ),
      )
    );
  }
}