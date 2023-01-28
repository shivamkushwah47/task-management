import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:visiter_app/core/firebase/firebase.dart';

class DoneController extends GetxController {



  Stream<QuerySnapshot<Map<String, dynamic>>> DoneSnapshotu = FirebaseFirestore.instance
      .collection("mytask/mytask/Done").where("asignee", isEqualTo:  FireBase.userInfo['name'])
      .snapshots();
  Stream<QuerySnapshot<Map<String, dynamic>>> DoneSnapshota = FirebaseFirestore.instance
      .collection("mytask/mytask/Done")
      .snapshots();

}




