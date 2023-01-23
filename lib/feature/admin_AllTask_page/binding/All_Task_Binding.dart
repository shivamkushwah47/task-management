import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:visiter_app/feature/admin_AllTask_page/controller/All_Task_controller.dart';

class AllTaskBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AllTaskController());

  }
}