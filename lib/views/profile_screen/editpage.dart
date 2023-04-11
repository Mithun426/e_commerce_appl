
import 'dart:io';

import 'package:e_commerce_app/controller/profiles_controller.dart';
import 'package:e_commerce_app/widgets/bg_widget.dart';
import 'package:e_commerce_app/widgets/button.dart'; 
import 'package:e_commerce_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../consts/consts.dart';

class EditScreen extends StatelessWidget {
  final dynamic data;
  


  const EditScreen({Key? key , this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var  controller  =  Get.find<ProfileController>();
 

   
    return bgwidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar( backgroundColor:Colors.transparent,elevation:0 ,),
        body: 
           Obx(
             ()=> Column(
              mainAxisSize:MainAxisSize.min ,
              children: [
             // if data image url and controller path is empty
           
             data['imageurl'] == '' &&   controller.profileimgpath.isEmpty ? 
               Image.asset(imgS4,width: 100,fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make():
                //if data is not empty but controller path is empty
                
                 data['imageurl'] != ''  && controller.profileimgpath.isEmpty? 

                 
                 
                  Image.network(data['imageurl'],width:100 ,
                 fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make()

                
                : Image.file(File(controller.profileimgpath.value),
                 width:100 ,
                 fit: BoxFit.cover,
                 
                 
                 ).box.roundedFull.clip(Clip.antiAlias).make(),
           
           
           
                 10.heightBox, 
                 ourButton(color: redColor,onPress: (){
           
                  controller.changeImage(context);
                  
           
                 },textColor: whiteColor,title: "Change"),
                const  Divider(),
                 20.heightBox,
                 customTextfield(
                  controller: controller.nameController,
                  hint: namehint,title: name,ispass: false,),
                  customTextfield(
                    controller: controller.oldpassController,

                    hint: passwordhint,title: oldpass,ispass: true,),
                    10.heightBox,
                     customTextfield(
                    controller: controller.newpassController,

                    hint: password,title: newpass
                    ,ispass: true,),
                  20.heightBox,
                  controller.isloading.value ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor) ,

                  ):SizedBox(
                    width: context.screenWidth -60,
                    child: ourButton(color: redColor,onPress: () async{



                      controller.isloading(true);

                        if (controller.profileimgpath.value.isNotEmpty){
                          await controller.uploadProfileImg();
                        }else{
                          controller.profileImglink= data['imageurl'];

                        }
                       if (data['password'] == controller.oldpassController.text){

                         await controller.changeauthpassword(
                          email:data['email'],
                          password:controller.oldpassController.text,
                          newpassword:controller.newpassController.text, 
                          
                         );

                         
                     
                     await controller.updateProfile(
                      name: controller.nameController.text,
                     password: controller.newpassController.text,
                     imageurl: controller.profileImglink,
                    
                     
                      );
                     VxToast.show(context, msg:"updated ");

                       } else{
                         VxToast.show(context, msg:"Password not correct ");
                         controller.isloading(false);
                       }


                    },textColor: whiteColor,title: "Save")),
           
              ],
                     ).box.white.shadowSm.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(top: 40,left: 12,right: 12)).rounded.make(),
           )
        ),
      
    );
  }
}