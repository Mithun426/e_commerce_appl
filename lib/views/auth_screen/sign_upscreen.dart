import 'package:e_commerce_app/consts/consts.dart';

import 'package:e_commerce_app/controller/auth_controller.dart';
import 'package:e_commerce_app/views/auth_screen/home_screen.dart';
import 'package:e_commerce_app/widgets/app_logo.dart';
import 'package:e_commerce_app/widgets/bg_widget.dart';
import 'package:e_commerce_app/widgets/button.dart';
import 'package:e_commerce_app/widgets/custom_textfield.dart';

import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class signupscreen extends StatefulWidget {
  const signupscreen({super.key});

  @override
  State<signupscreen> createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  bool? isCheck = false;
  var controller = Get.put(Authcontroller());
  //text controllers

 var nameController=TextEditingController();
  var emailController=TextEditingController();
   var passwordController=TextEditingController();
    var passwordRetypeController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  bgwidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogo(),
              10.heightBox,
              "Join in $appname".text.fontFamily(bold).white.size(18).make(), 
              15.heightBox,
              Obx(() => 
                 Column(
                  children: [
                    customTextfield(hint:namehint,title: name ,controller: nameController,ispass: false),
                    customTextfield(hint: emailhint,title: email,controller: emailController,ispass: false),
                    customTextfield(hint: passwordhint,title: password,controller: passwordController,ispass: true),
                      customTextfield(hint: passwordhint,title: retype,controller: passwordRetypeController,ispass: true),
                    
                   
                 
              
                   5.heightBox,
                          
                   Row(children: [
                    Checkbox(
                      value: isCheck,
                      activeColor: redColor,
                      checkColor: whiteColor,
                     onChanged:(newValue){
                     setState(() {
                       isCheck = newValue;
                     });
                     },
                      ),
              
                    10.widthBox,
                    Expanded(
                      child: RichText(text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )
                          ),
                          TextSpan(
                            text: term,
                            style: TextStyle(
                              fontFamily: regular,
                              color: redColor,
                            )
                          ),
                          TextSpan(
                            text: "&",
                            style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )
                          ),
                          TextSpan(
                            text: privacy,
                            style: TextStyle(
                              fontFamily: regular,
                              color: redColor,
                            )
                          ),
                          
                          
                        ]
                      )
                      ),
                    )
                   ],
              
                   ),
                    5.heightBox,
                      
              
                     controller.isloading.value? const  CircularProgressIndicator(
                        valueColor:AlwaysStoppedAnimation(redColor) ,

                       ):  ourButton(color:isCheck == true? redColor:grey,title:signup,textColor:whiteColor,onPress:()  async {
                        if(isCheck != false){
                          controller.isloading(true);
                          try {
                            await controller.signMethod(context: context,email: emailController.text,password: passwordController.text).then((value) {
                                 return controller.storeUserdata(
                             email: emailController .text,
                             name: nameController.text,
                             password: passwordController.text,
                                 );
                        
                            }).then((value) {
                              VxToast.show(context,msg:loggedin);
                           
                              Get.offAll( const Homescreen());
              
              
                            });
                            
                          } catch (e){
                            auth.signOut();
                            VxToast.show(context,msg:e.toString());
                            controller.isloading(false);
              
              
              
                          }
                        }
              
              
              
              
                      }  ).box.width(context.screenWidth -50).make(),
              
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      account.text.color(fontGrey).make(),
                      login.text.color(redColor).make().onTap(() {
                        Get.back();
                      })
                    ],
                  )
                     
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