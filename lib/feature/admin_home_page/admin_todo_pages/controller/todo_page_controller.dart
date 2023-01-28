import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
class TodoController extends GetxController {
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    var db=await Hive.openBox('mytask');
    FireBase.userInfo.value=db.get('userInfo');
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> todosnapshotu = FirebaseFirestore.instance
      .collection("mytask/mytask/todo").where("asignee",isEqualTo: FireBase.userInfo['name'])
      .snapshots();

  Stream<QuerySnapshot<Map<String, dynamic>>> todosnapshota = FirebaseFirestore.instance
      .collection("mytask/mytask/todo")
      .snapshots();
}