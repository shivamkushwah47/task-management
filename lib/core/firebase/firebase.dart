import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:visiter_app/core/routes.dart';

import '../components/loader.dart';
import '../components/snackbar.dart';

class FireBase {
  static bool isPhoneExist = false;
  static bool isEmailExist = false;
  static FirebaseMessaging fmessaging = FirebaseMessaging.instance;
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

  //Function for signup users

  static Future addUser(context, name, email, phone, password, role) async {
    var id = DateTime.now().millisecondsSinceEpoch.toString();
    await fmessaging.requestPermission();
    String pushtoken = '';
    await fmessaging.getToken().then((token) {
      if (token != null) {
        log('push token:$token');
        pushtoken = token;
      }
    });

    Map<String, dynamic> userData = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "role": role,
      'id': id,
      'pushToken': pushtoken
    };

    await FirebaseFirestore.instance
        .collection('mytask/mytask/users/')
        .doc(id)
        .set(userData)
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

  //add Team (signup users)
  static Future addTeam(context, name, email, phone, password, role) async {
    var id = DateTime.now().millisecondsSinceEpoch.toString();
    await fmessaging.requestPermission();
    String pushtoken = '';
    await fmessaging.getToken().then((token) {
      if (token != null) {
        log('push token:$token');
        pushtoken = token;
      }
    });

    Map<String, dynamic> userData = {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "role": role,
      'id': id,
      'pushToken': pushtoken
    };

    await FirebaseFirestore.instance
        .collection('mytask/mytask/users/')
        .doc(id)
        .set(userData)
        .then((value) => {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.success,
                title: 'Success',
                desc: 'You have been successfully added a New Member',
                dismissOnTouchOutside: false,
                //btnOkOnPress: () => Get.toNamed(Routes.HomePage),
              ).show()
            });
    print("Team Member added in firebase");
  }

  //Login Function
  static bool isMatch = false;
  static RxMap userInfo = {}.obs;

  static Future getData(context, phone, pass) async {
    final prefs = await SharedPreferences.getInstance();
    var db = await Hive.openBox('mytask');
    var role = '';
    String pushtoken = '';
    await fmessaging.getToken().then((token) {
      if (token != null) {
        log('push token:$token');
        pushtoken = token;
      }
    });
    Loader.showLoader(context);
    firestore.collection('mytask/mytask/users/').get().then((snapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach(
        (e) async {
          var data = e.data();
          if ((data['phone'] == phone || data['email'] == phone) &&
              data['password'] == pass) {
            isMatch = true;
            firestore
                .collection('mytask/mytask/users')
                .doc(data['id'])
                .update({"pushToken": pushtoken});
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
        } else if (role == "user") {
          Get.offAllNamed(Routes.UserBottomBar);
        } else {
          Get.offAllNamed(Routes.signup);
        }
      } else {
        const Snackbar(title: 'Warning', msg: 'Invalid credentials').snack1();
      }
    });
  }

  //change pass function

  static updatePass(context, password, id) {
    Loader.showLoader(context);
    firestore.collection('mytask/mytask/users/').doc(id).update({
      "password": password,
    }).then((value) => {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            title: 'Success',
            desc: 'You have been successfully updated your Password',
            dismissOnTouchOutside: true,
            // btnOkOnPress: () => Get.back(),
          ).show()
        });
  }

  static deleteUser(id, context) async {
    Loader.showLoader(context);
    await Hive.deleteBoxFromDisk('mytask');
    firestore.collection('mytask/mytask/users/').doc(id).delete().then(
          (value) => Get.offAllNamed(Routes.login),
        );
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
      'report': userInfo["name"],
      'createDate': DateTime.now(),
    };
    var id2 = DateTime.now().millisecondsSinceEpoch.toString();

    await FirebaseFirestore.instance
        .collection('mytask/mytask/todo/')
        .doc(id)
        .set(CreateTaskData)
        .then((value) => {
              FirebaseFirestore.instance
                  .collection('mytask/mytask/alltask/')
                  .doc(id2)
                  .set(CreateTaskData)
                  .then((value) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  title: 'Success',
                  desc: 'Your task has been successfully created',
                ).show();
              })
            });
    print("your task created");
  }

  //function for send Notification
  static sendNotification(token) async {
    print("in notification");
    print(token[2]);
    try {
      final body = {
        "to": token[2],
        "notification": {
          "title": 'My Task',
          "body": " hey ${token[0]} you have got a task"
        }
      };
      print(token[0]);

      // ignore: unused_local_variable
      var response = await post(
          Uri.parse('https://fcm.googleapis.com/fcm/send'),
          body: jsonEncode(body),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader:
                "key=AAAAZJVMrEY:APA91bGCwcY4hhBolnwANsWg0_k8gFwIVs6sjIWz9cRb5iVnXF8p7EeV6U9JAWPDlmmy2PyPj-bXts1KMXdNxDJ-sCyBVXLFhtXJ814onGO-AYYys8zmx6Midd2VshCuDcFXdrAE70rD"
          });
    } catch (e) {
      log('$e');
    }
  }
}
