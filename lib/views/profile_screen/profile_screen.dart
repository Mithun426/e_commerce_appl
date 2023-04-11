import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/controller/auth_controller.dart';

import 'package:e_commerce_app/controller/profiles_controller.dart';
import 'package:e_commerce_app/services/firebase_services.dart';
import 'package:e_commerce_app/views/auth_screen/login_screen.dart';
import 'package:e_commerce_app/views/profile_screen/components/details_screen.dart';
import 'package:e_commerce_app/views/profile_screen/editpage.dart';

import 'package:e_commerce_app/widgets/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgwidget( 
      child: Scaffold(
   body: StreamBuilder(
    stream: FireStoreServices.getUser(currentUser!.uid),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
      if(!snapshot.hasData){
        return const  Center(
          child:CircularProgressIndicator(valueColor:AlwaysStoppedAnimation(redColor) 
        
        ,)
        
         );
      } 
      else {
        var data = snapshot.data!.docs[0];  
        return SafeArea(
   
    child: Column(
      
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          
          child: const Align(alignment: Alignment.topRight,child: Icon(Icons.edit,color: whiteColor,)).onTap(() {
            controller.nameController.text = data['name'];
           
            Get.to(() =>  EditScreen(data: data));
          }), 
        ),
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              data['imageurl'] == ''  ?
               Image.asset("assets/images/man.png",width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()
               :Image.network(data['imageurl'],width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),


              10.widthBox,
              Expanded(child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "${data['name']}".text.fontFamily(semibold).white.make(),
                  5.heightBox,
                  "${data['email']}".text.white.make(), 
                ],
              )
              ),
        
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: whiteColor,
                  )
                ),
                
                onPressed:() async {
                  await Get.put(Authcontroller()).signoutMethod(context);
                  Get.offAll(()=> const loginscreen());
                } , child:logout.text.white.fontFamily(semibold).make()
                )
            ],
          ),
        ),
        20.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Detailscard(count: data['cart_count'],title: "In your Cart",width: context.screenWidth / 3.4),
            Detailscard(count: data['wishlist_count'],title: "In your Wishlist",width: context.screenWidth / 3.4),
            Detailscard(count:  data['order_count'],title: "My Orders",width: context.screenWidth / 3.4),
          
          ],
        ),

     //
     40.heightBox,
      ListView.separated(itemCount: profilelist.length,
      shrinkWrap: true,
     separatorBuilder: (context, index) {
       return const Divider(color: lightGrey,);
     },
     itemBuilder:(BuildContext context,int  index) {
      return ListTile(
        leading: Image.asset(profileicon[index],width: 22,),
        title:profilelist[index].text.make() ,
      );
       
     }
     ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make()
      ]
     





      
    ),
   
   );
       

  }

    }



   )

      )  
      );
    

  }
}