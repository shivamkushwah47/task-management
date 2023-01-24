import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:visiter_app/core/routes.dart';

import '../components/loader.dart';
import '../components/snackbar.dart';

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



  static bool isMatch = false;
  static RxMap userInfo = {}.obs;

  static Future getData(context, phone, pass) async {
    final prefs = await SharedPreferences.getInstance();
    var db = await Hive.openBox('mytask');
    var role = '';
    Loader.showLoader(context);
    firestore.collection('mytask/mytask/users/').get().then((snapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach(
            (e) async {
          var data = e.data();
          if ((data['phone'] == phone || data['email'] == phone) &&
              data['password'] == pass) {
            isMatch = true;
            role = data['role'];
            db.put('userInfo', {
              'name': data['name'],
              'email': data['email'],
              'phone': data['phone'],
              'password': data['password'],
              'role': data['role'],

            });

            await prefs.setBool('isLogin', true);
          }
        },
      );
    }).then((value) {
      Get.back();
      if (isMatch) {
        if (role == 'admin') {
          Get.offAllNamed(Routes.bottombar);
        } else {
          Get.offAllNamed(Routes.signup);
        }
      } else {
        const Snackbar(title: 'Warning', msg: 'Invalid credentials')
            .snack1();
      }
    });
  }


  }


