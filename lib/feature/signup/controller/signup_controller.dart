import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/core/components/loader.dart';
import 'package:visiter_app/core/components/snackbar.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
import 'package:visiter_app/feature/register/Controller/register_cotroller.dart';

class SignupController extends GetxController {
  final countryPicker = const FlCountryCodePicker();
  final GlobalKey<FormState> signupformkey = GlobalKey<FormState>();
  static TextEditingController phoneController = TextEditingController();
  static String verificationId = "";
  var phonevalue = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? isvalid(String value) {
    if (value.length < 10) {
      return "Password must be of 6 character";
    }
    return null;
  }

  isSignupValid(value, msg) {
    if (value == null || value.isEmpty) {
      return 'Enter $msg';
    }
  }

  SignupValidate(context) async {
    if (signupformkey.currentState!.validate()) {
      print("form validated");
      Loader.showLoader(context);
      if (!(await InternetConnectionChecker().hasConnection)) {
        Get.back();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Warning!!',
          desc: 'Check internet connection',
        ).show();
      } else {
        FireBase.checkUserByNum(SignupController.phoneController.text)
            .then((value) {
          if (FireBase.isPhoneExist) {
            Get.back();
            const Snackbar(
                    title: 'Warning', msg: 'This phone is already exist ')
                .snack1();
          } else {
            verifybyphone(SignupController.phoneController, context);
          }
        });
      }
    }
  }

  verifybyphone(phone, context) async {
    Loader.showLoader(context);
    await _auth.verifyPhoneNumber(
        phoneNumber: "+91${phone.text}",
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (FirebaseAuthException exception) {
          Get.back();
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  title: 'Error',
                  desc: '${exception.message}')
              .show();
          print("verificationFailed");
        },
        codeSent: (verificationID, resendingToken) async {
          Get.back();
          verificationId = verificationID;
          Get.offNamed(Routes.otp, arguments: verificationId);
        },
        codeAutoRetrievalTimeout: (verificationID) async {});
  }

  googleLogin(context) async {
    Loader.showLoader(context);
    if (!(await InternetConnectionChecker().hasConnection)) {
      Get.back();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        title: 'Warning!!',
        desc: 'Check internet connection',
      ).show();
    } else {
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
        RegisterController.giveaccess = false;
        Get.offAndToNamed(Routes.googleRegister, arguments: result.email);
      } catch (error) {
        print("Error");
        print(error);
      }
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }
}
