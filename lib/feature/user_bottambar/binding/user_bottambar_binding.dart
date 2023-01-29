import 'package:get/get.dart';
import 'package:visiter_app/feature/admin_AllTask_page/controller/All_Task_controller.dart';
import 'package:visiter_app/feature/admin_create_task/controller/create_task_controller.dart';
import 'package:visiter_app/feature/admin_home_page/controller/home_page-controller.dart';
import 'package:visiter_app/feature/user_bottambar/controller/user_bottambar_controller.dart';





class UserBottomBarBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(UserBottomBarController());
    Get.put(AllTaskController());
    Get.put(CreateTaskController());


    Get.lazyPut(()=>HomePageController());

  }

}