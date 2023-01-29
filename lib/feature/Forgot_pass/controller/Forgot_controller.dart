import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:visiter_app/core/routes.dart';

import '../../../core/components/loader.dart';
import '../../../core/components/snackbar.dart';
import '../../../core/firebase/firebase.dart';

class ForgotController extends GetxController {

  final getStorage = GetStorage();
  final GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phone = TextEditingController();
  static String verificationId = "";


  var phonevalue = '';

  RxBool autologin = false.obs;
  bool formSatus = true;

  var email = '';
  var password = '';



  @override
  void onInit() {
    super.onInit();
    // autologin.value = true;
  }


  // signupformvalid() {
  //   if (forgetFormKey.currentState!.validate()) {
  //     if (autologin.value = false) {
  //       print("Login Form vaidated");
  //       checkconnl();
  //       return true;
  //     }
  //   }
  // }


  // isEmail(email) {
  //   bool isEmailValid = EmailValidator.validate(email);
  //   if (!isEmailValid) {
  //     bool isdigit = isNumeric(email);
  //     if (isdigit) {
  //       if (!(email.length == 10)) {
  //         formSatus = false;
  //         Get.snackbar(
  //           'Warning',
  //           'Please enter 10 digit number',
  //           colorText: Colors.white,
  //           backgroundColor: Colors.blue,
  //         );
  //         return false;
  //       }
  //     } else {
  //       formSatus = false;
  //       Get.snackbar(
  //         'Warning',
  //         'Plese Enter valid email',
  //         colorText: Colors.white,
  //         backgroundColor: Colors.red,
  //       );
  //       return false;
  //     }
  //   }
  //   return true;
  // }

  isValid(value, msg) {
    if (value == null || value.isEmpty) {
      return msg;
    }
    return null;
  }


  // void checkconnl() async {
  //   var connectionresult = await (Connectivity().checkConnectivity());
  //   if (connectionresult == ConnectivityResult.none) {
  //     print("No internet Connection");
  //     Get.snackbar("No Internet", "Please turn on your internet connection",
  //         backgroundColor: Colors.redAccent,
  //         colorText: Colors.white,
  //         snackPosition: SnackPosition.BOTTOM
  //     );
  //   } else if (connectionresult == ConnectivityResult.wifi ||
  //       connectionresult == ConnectivityResult.mobile) {
  //     forget();
  //   }
  // }
  // forget()async{
  //   await FirebaseAuth.instance
  //       .sendPasswordResetEmail(email: emailController.text.toString()).then((value) => {
  //     Get.snackbar(snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.indigo,
  //         colorText: Colors.white, emailController.text, 'Please Check Your Mail Box')
  //
  //   });
  // }


//forgot pass


  ForgotPassword(context) async {
    if (forgetFormKey.currentState!.validate()) {
      print("form validated");
      print(phone.text);
      Loader.showLoader(context);
      if (!(await InternetConnectionChecker().hasConnection)) {
        Get.back();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Warning!!!',
          desc: 'Check internet connection',
        ).show();
      } else {
        Get.back();
        FireBase.checkUserByNum(phone.text).then((value) {
          if (FireBase.isPhoneExist) {
            print('the number is' + phone.text);
            print('phone exist');
            forget(context, phone.text);
          } else {
            const Snackbar(msg: 'Phone number not registered', title: 'Warning')
                .snack1();
          }
        });
      }
    }
  }

  forget(context, phone) async {
    Loader.showLoader(context);
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${phone}",
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (FirebaseAuthException exception) {
          Get.back();
          AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              title: 'Error',
              desc: '${exception.message}',

            )
              .show();
          print("verificationFailed");
          Get.back();
        },
        codeSent: (verificationID, resendingToken) async {
          Get.back();
          print('This is $phone no.');
          verificationId = verificationID;
          Get.offNamed(Routes.ForgotOtp, arguments: [verificationID,phone]);

        },
        codeAutoRetrievalTimeout: (verificationID) async {});



  }

}



