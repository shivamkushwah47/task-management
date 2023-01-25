import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

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
  var phone = '';
  var password = '';
  var confirmPassword = '';
  isvalid(value, pval) {
    if (value == null || value.isEmpty) {
      return 'Enter $pval';
    }
  }

}