import 'package:e_commerce_app/consts/colors.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/views/Home_screen/components/featured_button.dart';
import 'package:flutter/material.dart';

import '../../widgets/home_buttons.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    color: lightGrey,
    width: context.screenWidth,
    height: context.screenHeight,
    child: SafeArea(child: Column(
      children: [

        Container(
          alignment: Alignment.center,
          height:60 ,

       padding: EdgeInsets.all(12),
          color: lightGrey,
          child: TextField(

            decoration: InputDecoration(
              filled: true,
              fillColor: whiteColor,
              hintText: search,
              hintStyle: TextStyle(color: textfieldGrey),
              suffixIcon: Icon(Icons.search),


             ),
          ),
        ),
        5.heightBox,
     Expanded(
       child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
         child: Column(
          children: [
              VxSwiper.builder(
            aspectRatio: 16/9,
            autoPlay: true,
            height:150 ,
            enlargeCenterPage: true,
       
            itemCount:sliderList.length , itemBuilder:(context, index){
              return Image.asset(sliderList[index],fit: BoxFit.fill,).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
              
            }
            ),
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: 
                List.generate(2, (index) => homeButton(height:context.screenHeight *0.13,width:context.screenWidth / 3,
                icon:index == 0? icTodaysDeal : icFlashDeal,
                title:index == 0 ? todaydeal:flashsale,
       
                
                )),
                
              
            ),
             10.heightBox,
           VxSwiper.builder(
            aspectRatio: 24/9,
            autoPlay: true,
            autoPlayAnimationDuration: Duration(milliseconds: 600),
           autoPlayInterval: Duration(seconds: 1),
            
            height:150 ,
            enlargeCenterPage: true,
       
            itemCount:secondsliderList.length , itemBuilder:(context, index){
              return Image.asset(secondsliderList[index],fit: BoxFit.fill,).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
              
            }
            ),
       
            10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: 
                List.generate(3, (index) => homeButton(height:context.screenHeight *0.13,
                width:context.screenWidth / 3.5,
                icon: index==0? icTopCategories: index==1 ? icBrands:icTopSeller,
                title: index==0 ?topcategories: index==1 ?brand: topseller
       
                ))
              
            ),
            20.heightBox,
            Align(
              alignment: Alignment.centerLeft,
              
              child: featured.text.color(darkFontGrey).size(18).fontFamily(semibold).make()),
              20.heightBox,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: 
                  List.generate(3, (index) => Column(
                    children: [
                      featuredButton( icon: featuredimages1[index],title: featuredlist1[index]),
                      10.heightBox,
                      featuredButton(icon: featuredimages2[index],title: featuredlist2[index]),
                      SizedBox(height: 15,)
                    ],
                  )
                  ).toList(),
                
              
                ),
              ),
              20.heightBox,
              Container(
                padding:EdgeInsets.all(12),
                width: double.infinity,
                decoration: const BoxDecoration(color: redColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    featuredproduct.text.white.fontFamily(bold).size(18).make(),
                    10.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(6, (index) => Column(
                          children: [
                            Image.asset(imgP1,width: 150,fit: BoxFit.cover,),
                    
                            10.heightBox,
                            "Laptop".text.fontFamily(semibold).color(darkFontGrey).make(),
                            10.heightBox,
                            "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                          ],
                    
                    
                        ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(EdgeInsets.all(8)).make()),
                       
                        
                      ),
                    )
                  ],

                ),
              ),
              10.heightBox,

         // swiper
         VxSwiper.builder(
            aspectRatio: 16/9,
            autoPlay: true,
            height:150 ,
            enlargeCenterPage: true,
       
            itemCount:sliderList.length , itemBuilder:(context, index){
              return Image.asset(sliderList[index],fit: BoxFit.fill,).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
              
            }
            ),
            20.heightBox,
            GridView.builder(shrinkWrap: true,itemCount: 6,physics: const NeverScrollableScrollPhysics(),
              
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,mainAxisExtent: 300,crossAxisSpacing: 8), itemBuilder:(context,index){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            
                            Image.asset(imgP2,width: 200,fit: BoxFit.cover,height: 200,),
                    
                           const Spacer(),
                            "Laptop".text.fontFamily(semibold).color(darkFontGrey).make(),
                            10.heightBox,
                            "\$600".text.color(redColor).fontFamily(bold).size(16).make(),
                          ],
                    
                    
                        ).box.white.margin(EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(EdgeInsets.all(12)).make();
            })
       
          
       
          ],
          
          
         ),
       ),
     )


      ] 
    )),

    );
  }
}