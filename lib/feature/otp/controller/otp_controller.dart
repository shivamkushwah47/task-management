import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiter_app/Core/routes.dart';
import 'package:visiter_app/core/components/loader.dart';

class OtpController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  dynamic verificationData = Get.arguments;
  var code = "";


  @override
  void onInit() {
    super.onInit();
  }

  otpverify(context) async {
    Loader.showLoader(context);
    try {
      print("this is code and verfication Id");
      print(code);
      print(verificationData);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: this.verificationData, smsCode: code);
      final authCred = await _auth.signInWithCredential(credential);
      if(authCred.user!=null){
        Get.back();
        Get.offAllNamed(Routes.register);
      }

    } on FirebaseAuthException {
      Get.back();
      Get.snackbar("Wrong OTP", "Otp that you entered was wrong.",
          backgroundColor: Colors.indigo,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
      print('Wrong OTP');




    }
  }
}
