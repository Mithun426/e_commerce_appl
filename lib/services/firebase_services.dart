import 'package:e_commerce_app/consts/consts.dart';

class FireStoreServices{
  //get users data 
  static getUser(uid){
    return firestore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }



}