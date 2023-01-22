import 'package:cloud_firestore/cloud_firestore.dart';

class Firebase {
  static bool isPhoneExist = false;

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


}