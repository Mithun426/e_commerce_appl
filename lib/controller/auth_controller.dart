
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Authcontroller extends GetxController{
  var isloading = false.obs;

  //text controllers
   var emailController = TextEditingController();
   var passwordController = TextEditingController();






  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try{
        userCredential =  await auth.signInWithEmailAndPassword(email: emailController.text,password:passwordController.text);

    }   on FirebaseAuthException     catch(e){

    VxToast.show(context, msg: e.toString());
    }
    return userCredential;

  }

  // sign up 
   Future<UserCredential?> signMethod({email,password,context}) async {
    UserCredential? userCredential;
    try{
           userCredential = await auth.createUserWithEmailAndPassword(email: email,password:password);

    }   on FirebaseAuthException     catch(e){

    VxToast.show(context, msg: e.toString());
    }
    return userCredential;

  }

  // storing data 
  storeUserdata({name,password,email}) async {
    DocumentReference store = firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'name': name,
      'password':password,
      'email': email,
      'imageurl':' ', 
      'id': currentUser!.uid,
      'cart_count':"00",
      'order_count':"00",
      'wishlist_count':"00",
    });


  }

  //signout 

  signoutMethod(context) async {
    try{
      await auth.signOut();

    } catch (e){
      VxToast.show(context, msg:e.toString());
    }
  }



}