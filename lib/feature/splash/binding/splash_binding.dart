import 'package:get/get.dart';
import 'package:visiter_app/feature/Introduction/controller/introduction_controller.dart';
import 'package:visiter_app/feature/splash/controller/splash_controller.dart';
import 'package:visiter_app/feature/splash/controller/splash_controller.dart';


class SplashBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(SplashController());
    Get.put(IntroController());

  }
}
