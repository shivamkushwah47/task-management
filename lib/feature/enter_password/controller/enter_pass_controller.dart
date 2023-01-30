import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../Core/routes.dart';
import '../../../core/firebase/firebase.dart';

class EnterPassController extends GetxController {
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);


  static var giveaccess = true;
  late TextEditingController newpasswordController = TextEditingController();
  late TextEditingController confirmPasswordController = TextEditingController();

  // final password = TextEditingController();

  var phone = Get.arguments;

  final GlobalKey<FormState> EnterYourPassFormKey = GlobalKey<FormState>();


  var newpassword = '';
  var password = '';

  var isPasswordHidden = true.obs;
  Future<void> onInit() async {
    loader.value=false;
    super.onInit();
  }
  RxBool loader=true.obs;



  enterPass(context,password) async {
    print(password);
    print(phone);

    if (EnterYourPassFormKey.currentState!.validate()) {
      print("form validated");
      if (!(await InternetConnectionChecker().hasConnection)) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Warning!!',
          desc: 'Check internet connection',
        ).show();
      } else {
        Get.back();

        FireBase.forgetPass(phone, password).then((value) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            title: 'Success',
            desc: 'You have successfully reset your password',
            dismissOnTouchOutside: false,
            btnOkOnPress: () => Get.offAllNamed(Routes.login),
          ).show();
        });


      }
    }






  }
  clearText() {
    newpasswordController.clear();
    confirmPasswordController.clear();
  }


}