import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../Core/routes.dart';
import '../../../core/components/loader.dart';

class ForgotOtpController extends GetxController {

  FirebaseAuth _auth = FirebaseAuth.instance;
  var verificationData = Get.arguments;
  var code = "";
  static String verificationId = "";


  @override
  void onInit() {
    super.onInit();
  }

  otpverify(context) async {
    Loader.showLoader(context);
    try {
      print("this is code and {$verificationData[1]} is verfication Id");
      print(code);
      print(verificationData);
      print(verificationData[0]);
      print(verificationData[1]);
      print (verificationId);

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationData[0], smsCode: code);
      final authCred = await _auth.signInWithCredential(credential);
      if(authCred.user!=null){
        Get.back();
        Get.offAllNamed(Routes.EnterPass,arguments:verificationData[1]);
      }

    } on FirebaseAuthException {
      Get.back();
      Get.snackbar("Wrong OTP", "Otp that you entered is wrong.",
          backgroundColor: Colors.indigo,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
      print('Wrong OTP');




    }
  }

}
