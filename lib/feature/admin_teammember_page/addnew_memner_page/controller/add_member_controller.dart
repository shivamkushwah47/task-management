import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:visiter_app/core/components/loader.dart';
import 'package:visiter_app/core/components/snackbar.dart';
import 'package:visiter_app/core/firebase/firebase.dart';

class AddMemberController extends GetxController {
  final GlobalKey<FormState> AddTeamkey= GlobalKey<FormState>();
  final EmailValidator = MultiValidator([
    RequiredValidator(errorText: "Email is required"),
    PatternValidator(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
        errorText: 'Enter valid email')
  ]);
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);


  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  var name = '';
  var email = '';
  var phone = '';
  var password = '';
  // var confirmPassword = '';

  // dynamic googleArgument = Get.arguments;

  addmember(context) async {
    if (AddTeamkey.currentState!.validate()) {
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
        FireBase.checkUserByEmail(email).then((value) {
          if (FireBase.isEmailExist) {
            Get.back();
            const Snackbar(title: 'Warning', msg: 'This Email is already exist ')
                .snack1();
          }
         else
          {
          
            FireBase.addTeam(context, name, email, phone, password, "user");
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

}