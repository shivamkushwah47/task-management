import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:visiter_app/core/routes.dart';

class DetailController extends GetxController{
  GlobalKey<FormState> SignupFormKey = GlobalKey<FormState>();
  late TextEditingController NameController2 =  TextEditingController();
  late TextEditingController emailId2 =  TextEditingController();
  late TextEditingController Number2 =  TextEditingController();
  late TextEditingController password2 =  TextEditingController();
  dynamic argumenData = Get.arguments;

  //Form validation
  validate() {
    if (SignupFormKey.currentState!.validate()) {
      print("form validated");
      addUser();
    }
  }
  isvalid(value,pval){
    if(value == null || value.isEmpty){
      return 'Enter $pval';
    }
  }

  //Logout Method
  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  //firebase
  addUser(){
    var name = NameController2.text;
    var email = emailId2.text;
    var phone = Number2.text;
    var password = password2.text;

    Map<String, dynamic> userData = {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      };

    FirebaseFirestore.instance.collection("users").add(userData);
    print("user created");
      // Get.offAndToNamed(Routes.login);

  }
}