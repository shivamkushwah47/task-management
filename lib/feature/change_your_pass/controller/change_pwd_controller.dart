import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../core/firebase/firebase.dart';

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
  // late TextEditingController confirmPasswordController = TextEditingController();

  final password = TextEditingController();

  dynamic argumenData = Get.arguments;

  final GlobalKey<FormState> ChangeYourPassFormKey = GlobalKey<FormState>();


  var oldpassword = '';
  var newpassword = '';
  var confirmPassword = '';
  var id = FireBase.userInfo['id'];

  var isPasswordHidden = true.obs;
  Future<void> onInit() async {
    var db=await Hive.openBox('mytask');
    FireBase.userInfo.value=db.get('userInfo');
    loader.value=false;
    super.onInit();
  }
  RxBool loader=true.obs;


  createNewPass(context,id,password) async {
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
        FireBase.updateEmpInfo(context, id, password);
        print(id);
        print(password);
      }
    }

    isvalid(value, pval) {
      if (value == null || value.isEmpty) {
        return 'Enter $pval';
      }
    }


  }
}