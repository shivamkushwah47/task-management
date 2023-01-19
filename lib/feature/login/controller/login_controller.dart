import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visiter_app/core/routes.dart';

class LoginController extends GetxController {

  final getStorage = GetStorage();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  RxBool autologin = false.obs;
  RxBool ispasshidden = true.obs;
  bool formSatus = true;
  var isPasswordHidden= true.obs;

  var email = '';
  var password = '';



  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    autologin.value = true;
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

 loginformvalid() {
    if (loginFormKey.currentState!.validate()) {
      if (isEmail(emailController.text)) {
        print("Login Form vaidated");
        checkconn();
        return true;
      }
    }
  }

  void checkconn() async {
    var connectionresult = await (Connectivity().checkConnectivity());
    if (connectionresult == ConnectivityResult.none) {
      print("No internet Connection");
      Get.snackbar("noInternet", "Please turn on internet connection",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM
      );
    } else if (connectionresult == ConnectivityResult.wifi||connectionresult == ConnectivityResult.mobile) {
      signInEmailPass();

    }
  }

  signInEmailPass() {
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text).then((value) {
       print("Login successfully");
    }).onError((error, stackTrace) {
      print("Error: ${error.toString()}");
    });
  }

  EmailPassSignout(){
    FirebaseAuth.instance.signOut().then((value) {
      print("Logout successfully");
    });
  }




  googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var result = await _googleSignIn.signIn();
      if (result == null) {
        return;
      }
      final userData = await result.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
      print(finalResult);
      print("Values is");
      print("Result $result");
      print(result.displayName);
      print(result.email);
      print(result.photoUrl);

      Get.toNamed(Routes.details, arguments: result.email);
    } catch (error) {
      print("Error");
      print(error);
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

}