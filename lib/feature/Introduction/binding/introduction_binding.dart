import 'package:get/get.dart';

import '../controller/introduction_controller.dart';

class IntroBind extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(IntroController());

  }

}