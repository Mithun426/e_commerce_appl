import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/consts/lists.dart';
import 'package:e_commerce_app/controller/auth_controller.dart';
import 'package:e_commerce_app/views/auth_screen/home_screen.dart';
import 'package:e_commerce_app/views/auth_screen/sign_upscreen.dart';
import 'package:e_commerce_app/widgets/app_logo.dart';
import 'package:e_commerce_app/widgets/bg_widget.dart';
import 'package:e_commerce_app/widgets/button.dart';
import 'package:e_commerce_app/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Authcontroller());
    return bgwidget(
      child: Scaffold(
         resizeToAvoidBottomInset: false,
        body: Center(
       
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                applogo(),
                10.heightBox,
                "Log in to $appname".text.fontFamily(bold).white.size(18).make(), 
                10.heightBox,
                Obx(
                  () => Column(
                    children: [
                      customTextfield(hint: emailhint,title: email,ispass: false,controller:controller.emailController),
                      customTextfield(hint: passwordhint,title: password,ispass: false,controller: controller.passwordController),
                      Align(
                        alignment: Alignment.centerRight,
                        
                        child: TextButton(onPressed:(){}, child:forgotpass.text.make( ) )),
                        5.heightBox,
                        
                          
                       controller.isloading.value ? const  CircularProgressIndicator(
                        valueColor:AlwaysStoppedAnimation(redColor) ,

                       ) 
                       :  ourButton(color:redColor,title:login,textColor:whiteColor,onPress:() async {
                        controller.isloading(true);
                
                         await controller.loginMethod(context: context).then((value){
                           if(value != null){
                             VxToast.show(context,msg:loggedin);
                             Get.offAll(()=>const Homescreen());
                             
                           }else{
                             controller.isloading(false);
                           }
                         });
                        }  ).box.width(context.screenWidth -50).make(),
                          
                     5.heightBox,
                     createnewaccount.text.color(fontGrey).make(),
                     5.heightBox,
                          
                    ourButton(color:lightgolden,title:signup,textColor:redColor,onPress:(){
                      Get.to(()=>const signupscreen());
                    }  ).box.width(context.screenWidth -50).make(),
                    10.heightBox,
                    loginwith.text.color(fontGrey).make(),
                    5.heightBox,
                          
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                    List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(socialIconList[index],
                        width: 30,)
                      ),
                    ))
                   ,)
                          
                    ],
                          
                  ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth -70).make(),
                )
                
                
              ],
            ),
          

        )
      )
    );
      

       
       
      

    
  }
}