import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiter_app/Core/routes.dart';

class OtpController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  dynamic verificationData = Get.arguments;
  var code = "";

  otpverify() async {
    try {
      print("this is code and verfication Id");
      print(code);
      print(verificationData);
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: this.verificationData, smsCode: code);
      await _auth.signInWithCredential(credential);
      Get.toNamed(Routes.apiform);
    } catch (e) {
      Get.snackbar("Wrong OTP", "Otp that you entered was wrong.",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
      print('Wrong OTP');
    }
  }
}
