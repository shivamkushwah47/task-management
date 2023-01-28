import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class InProgressController extends GetxController {
  var InprogressMap2;


  @override
  void onInit() {
    super.onInit();

  }
  gotoDone(context)async{
    var id = DateTime.now().millisecondsSinceEpoch.toString();
    var tempInprogressMapId = InprogressMap2['id'];
    print(tempInprogressMapId);
    await FirebaseFirestore.instance
        .collection("mytask/mytask/InProgress")
        .doc(tempInprogressMapId)
        .delete()
        .then((value) => {
      FirebaseFirestore.instance
          .collection("mytask/mytask/Done/")
          .doc(id)
          .set(InprogressMap2).then((value)  {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: 'Congratulation',
          desc: 'Your task has been Done',
        ).show();
      })
    });
  }
}