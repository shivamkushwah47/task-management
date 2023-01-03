import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
