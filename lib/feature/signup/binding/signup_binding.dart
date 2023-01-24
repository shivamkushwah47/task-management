import 'package:get/get.dart';
import 'package:visiter_app/feature/signup/controller/signup_controller.dart';


class SignupBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(SignupController());



  }

}

