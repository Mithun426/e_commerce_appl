import 'package:e_commerce_app/consts/consts.dart';
import 'package:e_commerce_app/controller/home_controller.dart';
import 'package:e_commerce_app/views/Home_screen/home.dart';

import 'package:e_commerce_app/views/cart_screen/cart_screen.dart';
import 'package:e_commerce_app/views/category_screen/category_screen.dart';
import 'package:e_commerce_app/views/profile_screen/profile_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(HomeController());
    var navbarItem =[
      BottomNavigationBarItem(icon: Image.asset(icHome,width: 26,),label:home ,),
       BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26,),label:categories),
        BottomNavigationBarItem(icon: Image.asset(icCart,width: 26,),label:cart ),
         BottomNavigationBarItem(icon: Image.asset(icProfile,width: 26,),label:accounts ),
    ];
    var navBody = [
      const Home(),const CategoryScreen(),const cartScreen(),const ProfileScreen(),
      
    ];
    return Scaffold(


body: Column(
  children: [
        Obx(()=> Expanded(child: navBody.elementAt(controller.currentNavIndex.value))),
  ],
),
bottomNavigationBar: Obx(
  ()=>
   BottomNavigationBar(
    currentIndex: controller.currentNavIndex.value,
  
    items: navbarItem,
  
    backgroundColor: whiteColor,
  
    type: BottomNavigationBarType.fixed,
  
    selectedItemColor:redColor ,
  
    selectedLabelStyle:const TextStyle(fontFamily: semibold) ,
    onTap: (value){controller.currentNavIndex.value = value;
    },
  
    ),
),
    );
  }
}