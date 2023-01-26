import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ChangeYourPassController extends GetxController {
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);


  static var giveaccess = true;
  late TextEditingController oldpasswordController = TextEditingController();
  late TextEditingController newpasswordController = TextEditingController();
  late TextEditingController confirmPasswordController = TextEditingController();

  dynamic argumenData = Get.arguments;

  final GlobalKey<FormState> ChangeYourPassFormKey = GlobalKey<FormState>();

// var name = '';
// var phone = SignupController.phoneController.text;
// var email = '';
  var oldpassword = '';
  var newpassword = '';
  var confirmPassword = '';

  var isPasswordHidden = true.obs;


  createNewPass(context) async {
    if (ChangeYourPassFormKey.currentState!.validate()) {
      print("form validated");
      if (!(await InternetConnectionChecker().hasConnection)) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Warning!!',
          desc: 'Check internet connection',
        ).show();
      } else {
        // FireBase.addUser(context, name, email, phone, password, "admin");
      }
    }

    isvalid(value, pval) {
      if (value == null || value.isEmpty) {
        return 'Enter $pval';
      }
    }

    Future<void> logout() async {
      await GoogleSignIn().disconnect();
      FirebaseAuth.instance.signOut();
    }
  }
}