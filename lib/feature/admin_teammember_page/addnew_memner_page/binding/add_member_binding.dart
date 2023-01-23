import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:visiter_app/feature/admin_AllTask_page/controller/All_Task_controller.dart';
import 'package:visiter_app/feature/admin_teammember_page/addnew_memner_page/controller/add_member_controller.dart';

class AddMemberBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AddMemberController());




  }
}