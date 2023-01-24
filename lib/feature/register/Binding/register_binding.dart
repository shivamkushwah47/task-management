import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import '../Controller/register_cotroller.dart';


class RegisterBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(RegisterController());


  }

}