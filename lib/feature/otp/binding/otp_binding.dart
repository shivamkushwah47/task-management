import 'package:get/get.dart';

import '../controller/otp_controller.dart';

class OtpBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(OtpController());
  }

}