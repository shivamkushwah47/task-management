import 'package:get/get.dart';
import 'package:visiter_app/feature/google_register/controller/google_register_controller.dart';

class GoogleRegisterBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(GoogleRegisterController());
  }

}