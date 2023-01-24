import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:visiter_app/feature/admin_teammember_page/controller/team_page_controller.dart';

class TeamBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(TeamController());

  }
}