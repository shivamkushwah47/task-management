import 'package:get/get.dart';

import '../controller/Forgot_controller.dart';


class ForgotBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(ForgotController());



  }

}