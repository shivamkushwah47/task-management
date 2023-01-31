import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../controller/enter_pass_controller.dart';

class EnterPassBinding extends Bindings{
  @override
  void dependencies(){
    Get.put(EnterPassController());
  }

}