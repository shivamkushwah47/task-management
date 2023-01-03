import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:visiter_app/core/routes.dart';

class ForgetController extends GetxController {

  final getStorage = GetStorage();
  final GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  RxBool autologin = false.obs;
  RxBool ispasshidden = true.obs;
  bool formSatus = true;

  var email = '';
  var password = '';

  login() {
    getStorage.write("id", 1);
    getStorage.write("name", "shivam singh");
    Get.offAllNamed(Routes.dashboard);
  }

  @override
  void onInit() {
    super.onInit();
    autologin.value = true;
  }
  forget()async{
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.toString()).then((value) => {
          Get.snackbar(snackPosition: SnackPosition.BOTTOM, emailController.text, 'Please Check Your Mail Box')

    });


  }


  isEmail(email) {
    bool isEmailValid = EmailValidator.validate(email);
    if (!isEmailValid) {
      bool isdigit = isNumeric(email);
      if (isdigit) {
        if (!(email.length == 10)) {
          formSatus = false;
          Get.snackbar(
            'Warning',
            'Please enter 10 digit number',
            colorText: Colors.white,
            backgroundColor: Colors.blue,
          );
          return false;
        }
      } else {
        formSatus = false;
        Get.snackbar(
          'Warning',
          'Plese Enter valid email',
          colorText: Colors.white,
          backgroundColor:  Colors.red,
        );
        return false;
      }
    }
    return true;
  }

  isValid(value, msg) {
    if (value == null || value.isEmpty) {
      return msg;
    }
    return null;
  }

  signupformvalid() {
    if (forgetFormKey.currentState!.validate()) {
      if (isEmail(emailController.text)) {
        print("Login Form vaidated");
        return true;
      }
    }
  }

  void checkconnl() async {
    var connectionresult = await (Connectivity().checkConnectivity());
    if (connectionresult == ConnectivityResult.none) {
      print("No internet Connection");
      Get.snackbar("noInternet", "Please turn on internet connection",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM
      );
    } else if (connectionresult == ConnectivityResult.wifi) {
      print("wifi connection");

    } else if (connectionresult == ConnectivityResult.mobile) {
      print("mobileData connection");

    }
  }

}