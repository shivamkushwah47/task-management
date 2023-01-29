import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
import 'package:visiter_app/core/routes.dart';

class DrawersController extends GetxController{

  Logout()async{
    final pref = await SharedPreferences.getInstance();
    await pref.clear().then((value) {
      Get.offAllNamed(Routes.login);
    });

  }
  RxBool loader=true.obs;

  Future<void> onInit() async {
    var db=await Hive.openBox('mytask');
    FireBase.userInfo.value=db.get('userInfo');
    loader.value=false;
    super.onInit();
  }
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
}