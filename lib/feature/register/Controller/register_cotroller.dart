import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController confirmpassController = TextEditingController();


  final GlobalKey<FormState> SignUpFormKey = GlobalKey<FormState>();

  var name = '';
  var phone = '';
  var email = '';
  var password = '';
  var confirmPassword = '';

  var isPasswordHidden= true.obs;


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


  @override
  void onInit() {
    super.onInit();
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

  validate() {
    if (SignUpFormKey.currentState!.validate()) {
      print("form validated");

    }
  }
  isvalid(value,pval){
    if(value == null || value.isEmpty){
      return 'Enter $pval';
    }
  }

}