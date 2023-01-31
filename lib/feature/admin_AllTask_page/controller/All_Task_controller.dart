import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visiter_app/Core/routes.dart';
import 'package:visiter_app/core/firebase/firebase.dart';

class AllTaskController extends GetxController {
  var selectedDate;


  Stream<QuerySnapshot<Map<String, dynamic>>> allTaskSnapshota =  FirebaseFirestore.instance
      .collection("mytask/mytask/alltask")
      .snapshots();
  Stream<QuerySnapshot<Map<String, dynamic>>> allTaskSnapshotu = FirebaseFirestore.instance
      .collection("mytask/mytask/alltask").where("asignee", isEqualTo:FireBase.userInfo['name'])
      .snapshots();

  deleteUser(id, context) {
    print('id is'+ id);
    AwesomeDialog(
      context: context,
      title: 'Warning',
      dialogType: DialogType.infoReverse,
      desc: 'Are you sure to delete your account',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        FireBase.deleteUser(FireBase.userInfo['id'], context);
      },
    ).show();
  }

  Logout()async{
    final pref = await SharedPreferences.getInstance();
    await pref.clear().then((value) {
      Get.offAllNamed(Routes.login);
    });
  }

}