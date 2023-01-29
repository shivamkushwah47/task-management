import 'package:get/get.dart';
import 'package:visiter_app/feature/edit_create_task/Controller/edit_task_controller.dart';


class EditTaskBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(EditTaskController());
  }

}