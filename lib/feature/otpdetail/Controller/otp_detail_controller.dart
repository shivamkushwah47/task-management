import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiter_app/core/routes.dart';

class OtpDetailController extends GetxController {
  GlobalKey<FormState> SignupFormKey = GlobalKey<FormState>();

  late TextEditingController NameController = TextEditingController();
  late TextEditingController emailIdController = TextEditingController();
  late TextEditingController phoneCont = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  RxBool loader = false.obs;



  //post data by fireabase
  addUser() {
    var name = NameController.text;
    var email = emailIdController.text;
    var phone = phoneCont.value.text;
    var password = passwordController.text;
    var isValide = SignupFormKey.currentState?.validate();
    if (isValide == true) {
      Map<String, dynamic> userData = {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      };

      FirebaseFirestore.instance.collection("users").add(userData);
      print("user created by firebase");
    }
  }
  signUpEmailPass() {
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailIdController.text, password: passwordController.text).then((value) {
      Get.offAndToNamed(Routes.login);
    }).onError((error, stackTrace) {
      print("Error: ${error.toString()}");
    });
  }
}
