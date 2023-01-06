import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpDetailController extends GetxController {
  //late TextEditingController name, phone, email, password ,confirmpass;
  late TextEditingController name = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController phone = TextEditingController();
  late TextEditingController password = TextEditingController();
  late TextEditingController confirmpass = TextEditingController();


  final GlobalKey<FormState> SignUpFormKey = GlobalKey<FormState>();

  // var fname = '';
  // var pnumber = '';
  // var lemail = '';
  // var Epassword = '';


  // addUser() {
  //   var name = name.text;
  //   var email = emailIdController.text;
  //   var phone = phoneCont.value.text;
  //   var password = passwordController.text;
  //   var isValide = SignupFormKey.currentState?.validate();
  //   if (isValide == true) {
  //     Map<String, dynamic> userData = {
  //       "name": name,
  //       "email": email,
  //       "phone": phone,
  //       "password": password,
  //     };
  //
  //     FirebaseFirestore.instance.collection("users").add(userData);
  //     print("user created by firebase");
  //   }
  // }


  // addUser() {
  //   //var name = .value;
  //   var email = fname.val;
  //   var phone = phoneCont.value.text;
  //   var password = passwordController.text;
  //  // var isValide = SignupFormKey.currentState?.validate();
  //  // if (isValide == true)
  //   {
  //     Map<String, dynamic> userData = {
  //       "name": name,
  //       "email": email,
  //       "phone": phone,
  //       "password": password,
  //     };
  //
  //     FirebaseFirestore.instance.collection("users").add(userData);
  //     print("user created by firebase");
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    // name = TextEditingController();
    // phone = TextEditingController();
    // email = TextEditingController();
    // password = TextEditingController();
    // confirmpass= TextEditingController();
  }


  @override
  void onClose() {
    // name.dispose();
    // phone.dispose();
    // email.dispose();
    // password.dispose();
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
    final isvalide = SignUpFormKey.currentState?.validate();
    if (isvalide!) {
      internet();
    }
    SignUpFormKey.currentState!.save();
  }
  internet()async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      //final response = await _signUpRepo.signupAPI(NameController.text,EmailController.text,PasswordController.text,PhoneController.text);
      print("Response print");
    }
    else{
      print('net is off');
      Get.snackbar("Warning"," No Internet",snackPosition: SnackPosition.TOP,backgroundColor: Colors.purple,);

    }
  }

}
