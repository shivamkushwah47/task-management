import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:visiter_app/core/firebase/firebase.dart';

class AllTaskController extends GetxController {
  var selectedDate;


  Stream<QuerySnapshot<Map<String, dynamic>>> allTaskSnapshota =  FirebaseFirestore.instance
      .collection("mytask/mytask/alltask")
      .snapshots();
  Stream<QuerySnapshot<Map<String, dynamic>>> allTaskSnapshotu = FirebaseFirestore.instance
      .collection("mytask/mytask/alltask").where("asignee", isEqualTo:FireBase.userInfo['name'])
      .snapshots();

}