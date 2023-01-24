import 'package:get/get_navigation/get_navigation.dart';
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/feature/Introduction/binding/introduction_binding.dart';
import 'package:visiter_app/feature/Introduction/view/introduction_view.dart';
import 'package:visiter_app/feature/admin_create_task/binding/create_task_binding.dart';
import 'package:visiter_app/feature/admin_create_task/view/create_task_view.dart';
import 'package:visiter_app/feature/login/binding/login_binding.dart';
import 'package:visiter_app/feature/login/view/login_view.dart';
import 'package:visiter_app/feature/otp/binding/otp_binding.dart';
import 'package:visiter_app/feature/otp/view/otp_view.dart';
import 'package:visiter_app/feature/register/Binding/register_binding.dart';
import 'package:visiter_app/feature/register/View/register_view.dart';
import 'package:visiter_app/feature/signup/binding/signup_binding.dart';
import 'package:visiter_app/feature/signup/view/signup_view.dart';
import 'package:visiter_app/feature/splash/binding/splash_binding.dart';
import 'package:visiter_app/feature/splash/view/splash_view.dart';
import '../feature/Forgot_pass/binding/Forgot_binding.dart';
import '../feature/Forgot_pass/view/Forgot_view.dart';
import '../feature/profile/binding/profile_binding.dart';
import '../feature/profile/view/profile_view.dart';

List<GetPage> allpages = [
  GetPage(name: Routes.splash, page: () => SplashView(), binding: SplashBinding()),
  GetPage(name: Routes.intro, page: () => IntroView(), binding: IntroBind()),
  GetPage(name: Routes.signup, page: () => SignupView(), binding: SignupBinding()),
  GetPage(name: Routes.login, page: () => LoginView(), binding: LoginBinding()),
  GetPage(name: Routes.forgotpass, page: () => ForgotView(), binding: ForgotBinding()),
  GetPage(name: Routes.otp, page: () => OtpView(), binding: OtpBinding()),
  GetPage(name: Routes.register, page: () => RegisterView(), binding: RegisterBinding()),
  GetPage(name: Routes.CreateTask, page: () => CreateTaskView(), binding: CreateTaskBinding()),
  GetPage(name: Routes.profile, page: () => ProfileView(), binding: ProfileBinding()),
];
