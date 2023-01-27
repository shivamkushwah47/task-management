import 'package:get/get.dart';
import 'package:visiter_app/feature/admin_create_task/controller/create_task_controller.dart';
import '../../Forgot_pass/controller/Forgot_controller.dart';
import '../../admin_home_page/controller/home_page-controller.dart';
import '../../register/Controller/register_cotroller.dart';
import '../controller/bottombar_controller.dart';





class BottombarBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(BottombarController());
    Get.put(RegisterController());
    Get.put(ForgotController());
    Get.put(CreateTaskController());
    Get.lazyPut(()=>HomePageController());

  }

}