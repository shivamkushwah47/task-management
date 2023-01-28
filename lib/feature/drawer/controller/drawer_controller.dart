import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visiter_app/core/routes.dart';

class DrawersController extends GetxController{

  Logout()async{
    final pref = await SharedPreferences.getInstance();
    await pref.clear().then((value) {
      Get.offAllNamed(Routes.login);
    });

  }

}