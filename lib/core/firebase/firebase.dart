import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:visiter_app/core/routes.dart';

class FireBase {

  static bool isPhoneExist = false;
  static bool isEmailExist = false;

  static FirebaseFirestore firestore = FirebaseFirestore.instance;


  static Future checkUserByNum(phone) async {
    await firestore
        .collection('mytask/mytask/users/')
        .where('phone', isEqualTo: phone)
        .get()
        .then((e) {
      if (e.docs.isNotEmpty) {
        isPhoneExist = true;
      } else {
        isPhoneExist = false;
      }
    });
  }


  static Future checkUserByEmail(email) async {
    await firestore
        .collection('mytask/mytask/users/')
        .where('email', isEqualTo: email)
        .get()
        .then((e) {
      if (e.docs.isNotEmpty) {
        isEmailExist = true;
      } else {
        isEmailExist = false;
      }
    });
  }

  static Future addUser(context, name, email, phone, password, role) async{

      Map<String, dynamic> userData = {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "role": role
      };

      await FirebaseFirestore.instance
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


