import 'package:get/get.dart';
import 'package:visiter_app/feature/reasy_to_task/controller/ready_task_controller.dart';

class ReadyToTaskBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(ReadyToTaskController());
  }

}