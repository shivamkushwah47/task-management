import 'package:get/get.dart';
import '../controler/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(DashboardController());
  }
}
