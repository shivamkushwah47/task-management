import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:visiter_app/core/components/loader.dart';
import 'package:visiter_app/core/components/snackbar.dart';
import 'package:visiter_app/core/firebase/firebase.dart';


class GoogleRegisterController extends GetxController {
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  final EmailValidator = MultiValidator([
    RequiredValidator(errorText: "Email is required"),
    PatternValidator(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        errorText: 'Enter valid email')
  ]);


  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmpassController = TextEditingController();

  dynamic googleArgument = Get.arguments;

  final GlobalKey<FormState> GoogleFormKey = GlobalKey<FormState>();

  var name = '';
  var phone = '';
  var password = '';
  var confirmPassword = '';

  var isPasswordHidden = true.obs;

  createUser(context) async {
    if (GoogleFormKey.currentState!.validate()) {
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
        FireBase.checkUserByEmail(googleArgument).then((value) {
          if (FireBase.isEmailExist) {
            Get.back();
            const Snackbar(title: 'Warning', msg: 'This Email is already exist ')
                .snack1();
          }else{
            FireBase.addUser(context,name, googleArgument, phone, password, "admin");
          }
        });


      }
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

  @override
  void onClose() {
    // TODO: implement onClose
    logout();
    super.onClose();
  }
}
