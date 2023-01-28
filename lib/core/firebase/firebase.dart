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

  static Future addUser(context, name, email, phone, password, role) async {
    var id = DateTime.now().millisecondsSinceEpoch.toString();

    Map<String, dynamic> userData = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "role": role,
      'id': id,
    };

    await FirebaseFirestore.instance
        .collection('mytask/mytask/users/')
        .doc(id).set(userData)
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


  //add Team

  static Future addTeam(context, name, email, phone, password, role) async {
    var id = DateTime.now().millisecondsSinceEpoch.toString();

    Map<String, dynamic> userData = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "role": role,
      'id': id,
    };

    await FirebaseFirestore.instance
        .collection('mytask/mytask/users/')
        .doc(id).set(userData)
        .then((value) => {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        title: 'Success',
        desc: 'You have successfully added a New Member',
        dismissOnTouchOutside: false,
        // btnOkOnPress: () => Get.toNamed(Routes.HomePage),
      ).show()
    });
    print("Team Member added in firebase");
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
              'id': data['id'],
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
        const Snackbar(title: 'Warning', msg: 'Invalid credentials').snack1();
      }
    });
  }
  //change pass function

  static updateEmpInfo(context,password, id) {
    Loader.showLoader(context);
    firestore.collection('mytask/mytask/users/').doc(id).update({
      "password": password,
    }).then((value) => Get.back());
  }

  static deleteUser(id, context) async {
    Loader.showLoader(context);
    await Hive.deleteBoxFromDisk('mytask');
    firestore
        .collection('mytask/mytask/users/')
        .doc(id)
        .delete()
        .then((value) => Get.offAllNamed(Routes.login),);
  }

  //create task function
  static Future createTask(
      context, title, desc, asignee, priority, summarry) async {
    var id = DateTime.now().millisecondsSinceEpoch.toString();

    Map<String, dynamic> CreateTaskData = {
      "title": title,
      "description": desc,
      "asignee": asignee,
      "priority": priority,
      "summary": summarry,
      'id': id,

    };

    await FirebaseFirestore.instance
        .collection('mytask/mytask/todo/')
        .doc(id).set(CreateTaskData)
        .then((value) => {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                title: 'Success',
                desc: 'Your task has been successfully created',
              ).show()
            });
    print("your task created");
  }
}
