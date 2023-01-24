import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:visiter_app/core/routes.dart';

class SplashController extends GetxController {
  final getStorage = GetStorage();

  @override
  void onInit() {
    Timer(Duration(seconds: 4), () {
      Get.offAllNamed(Routes.intro);
    });
    super.onInit();
  }



}
