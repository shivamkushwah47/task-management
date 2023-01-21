import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/feature/signup/controller/signup_controller.dart';

class RegisterController extends GetxController {
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

  static var giveaccess = true;
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmpassController = TextEditingController();

  dynamic argumenData = Get.arguments;

  final GlobalKey<FormState> RegisterFormKey = GlobalKey<FormState>();

  var name = '';
  var phone = '';
  var email = '';
  var password = '';
  var confirmPassword = '';

  var isPasswordHidden = true.obs;

  addUser(context) {
    var name = nameController.text;
    var email = emailController.text;
    var phone = SignupController.phoneController.text;
    var password = passwordController.text;
    var isValide = RegisterFormKey.currentState?.validate();
    if (isValide == true) {
      Map<String, dynamic> userData = {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      };

      FirebaseFirestore.instance
          .collection('mytask/mytask/users/')
          .add(userData)
          .then((value) => {
      AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      title: 'Success',
      desc: 'You have successfully signup go back to login',
      dismissOnTouchOutside: false,
      btnOkOnPress: () => Get.offAllNamed(Routes.login),
      ).show()
      });
      print("user created by firebase");
    }
  }

  internet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      //final response = await _signUpRepo.signupAPI(NameController.text,EmailController.text,PasswordController.text,PhoneController.text);
      print("You are connected with internet");

    } else {
      print('net is off');
      Get.snackbar(
        "Warning",
        " No Internet",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.purple,
      );
    }
  }

  createUser(context) async {
    if (RegisterFormKey.currentState!.validate()) {
      print("form validated");
      if (!(await InternetConnectionChecker().hasConnection)) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Warning!!',
          desc: 'Check internet connection',
        ).show();
      } else {
        addUser(context);
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
