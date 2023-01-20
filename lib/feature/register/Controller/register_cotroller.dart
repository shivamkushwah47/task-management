import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:visiter_app/feature/signup/controller/signup_controller.dart';

class RegisterController extends GetxController {
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')
  ]);
  
  final EmailValidator = MultiValidator([
    RequiredValidator(errorText: "Email is required"),
    PatternValidator(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$', errorText: 'Enter valid email')

  ]);


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

  var isPasswordHidden= true.obs;


  addUser() {
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

      FirebaseFirestore.instance.collection("users").add(userData);
      print("user created by firebase");
    }
  }


  // String? validateEmail(String value) {
  //   Pattern pattern =
  //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //   RegExp regex = new RegExp(pattern.toString());
  //   if (!regex.hasMatch(value))
  //     return 'Enter Valid Email';
  //   else
  //     return null;
  // }
  //
  //
  // String? ValidatePassword(String value) {
  //   if (value.length < 6) {
  //     return "Password must be of 8 characters";
  //   }
  //   return null;
  // }
  // String? ValidateConfirmPassword(String value) {
  //   if (value.length < 6) {
  //     return "Password must be of 8 characters";
  //   }
  //   return null;
  // }


  // String? validateName(String value) {
  //   if (value.length < 3)
  //     return 'Name must be more than 2 charater';
  //   else
  //     return null;
  // }

//   String? validateMobile(String value) {
// // Indian Mobile number are of 10 digit only
//     if (value.length != 10)
//       return 'Mobile Number must be of 10 digit';
//     else
//       return null;
//   }


  SignUpAPI() {
    final isvalide = RegisterFormKey.currentState?.validate();
    if (isvalide!) {
      internet();
    }
    RegisterFormKey.currentState!.save();
  }
  internet()async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      //final response = await _signUpRepo.signupAPI(NameController.text,EmailController.text,PasswordController.text,PhoneController.text);
      print("You are connected with internet");
      addUser();

    }
    else{
      print('net is off');
      Get.snackbar("Warning"," No Internet",snackPosition: SnackPosition.TOP,backgroundColor: Colors.purple,);

    }
  }

  validate() {
    if (RegisterFormKey.currentState!.validate()) {
      print("form validated");
      internet();
    }
  }
  isvalid(value,pval){
    if(value == null || value.isEmpty){
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
