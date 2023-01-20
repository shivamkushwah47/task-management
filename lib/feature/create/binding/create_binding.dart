import 'package:get/get.dart';

import '../controller/create_controller.dart';



class CreateBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(CreateController());


  }

}