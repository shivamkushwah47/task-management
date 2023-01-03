import 'package:get/get.dart';
import '../../../Core/routes.dart';

class DashboardController extends GetxController{
  gotoLogin(){
    Get.toNamed(Routes.login);
  }
  gotoSignup(){
    Get.toNamed(Routes.signup);
  }

}