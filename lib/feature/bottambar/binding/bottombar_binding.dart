import 'package:get/get.dart';
// import '../../../core/repository/attendance/attendance_repo_impl.dart';
// import '../../../core/repository/detail/detail_repo_impl.dart';
// import '../../../core/repository/login/login_repo_impl.dart';
// import '../../attendance/attendance_controller.dart';
// import '../../mydetail/controller/detailController.dart';
// import '../../profile/profile_controller.dart';
import '../../Forgot_pass/controller/Forgot_controller.dart';
import '../../admin_home_page/controller/home_page-controller.dart';
import '../../register/Controller/register_cotroller.dart';
import '../controller/bottombar_controller.dart';





class BottombarBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    // Get.lazyPut(()=>AttendanceRepoImpl());
    // Get.lazyPut(()=>LoginRepoImpl());

    Get.put(BottombarController());
    // Get.put(HomePageController());
    Get.put(RegisterController());
    Get.put(ForgotController());
    Get.lazyPut(()=>HomePageController());
    // Get.lazyPut(()=>ProfileController());
    // Get.lazyPut(()=>DetailController());
    // Get.lazyPut(()=>DetailRepoImpl());
  }

}