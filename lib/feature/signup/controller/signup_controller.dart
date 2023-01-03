import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:visiter_app/Core/routes.dart';

class SignupController extends GetxController {
  final countryPicker = const FlCountryCodePicker();
  final myformkey = GlobalKey<FormState>();
  static TextEditingController phoneController = TextEditingController();
  static String verificationId = "";
  static var phonevalue= "";

  final FirebaseAuth _auth = FirebaseAuth.instance;


  String? isvalid(String value) {
    if (value.length < 10) {
      return "Password must be of 6 character";
    }
    return null;
  }

  validatenum() {
    final isValid = myformkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    myformkey.currentState!.save();
  }

  //For checking Internet Connection
  checkconn()async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      googleLogin();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      googleLogin();
    }else if (connectivityResult == ConnectivityResult.none) {
      Get.snackbar("NoInternet", "Please turn on internet connection",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
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

  verifybyphone() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: "+91${phoneController.text}",
        verificationCompleted: (phoneAuthCredential) async {

        },
        verificationFailed: (verificationFailed) {

          print(verificationFailed);
        },
        codeSent: (verificationID, resendingToken) async {

          verificationId = verificationID;
          Get.toNamed(Routes.otp, arguments: verificationId);

        },
        codeAutoRetrievalTimeout: (verificationID) async {});
  }

}
