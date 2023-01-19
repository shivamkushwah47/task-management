import 'package:get/get_navigation/get_navigation.dart';
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/feature/Forgetpass/view/forget_view.dart';
import 'package:visiter_app/feature/Introduction/binding/introduction_binding.dart';
import 'package:visiter_app/feature/Introduction/view/introduction_view.dart';
import 'package:visiter_app/feature/dashboard/binding/dashboard_binding.dart';
import 'package:visiter_app/feature/dashboard/view/dashboard_view.dart';
import 'package:visiter_app/feature/details/binding/details_binding.dart';
import 'package:visiter_app/feature/details/view/details_view.dart';
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
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/feature/Introduction/binding/introduction_binding.dart';
import 'package:visiter_app/feature/splash/binding/splash_binding.dart';
import '../feature/Forgetpass/binding/forget_binding.dart';

List<GetPage> allpages = [
  GetPage(name: Routes.splash, page: () => SplashView(), binding: SplashBinding()),
  GetPage(name: Routes.intro, page: () => IntroView(), binding: IntroBind()),
  GetPage(name: Routes.dashboard, page: () => DashboardView(), binding: DashboardBinding()),
  GetPage(name: Routes.signup, page: () => SignupView(), binding: SignupBinding()),
  GetPage(name: Routes.login, page: () => LoginView(), binding: LoginBinding()),
  GetPage(name: Routes.forgetpass, page: () => ForgetView(), binding: ForgetBinding()),
  GetPage(name: Routes.otp, page: () => OtpView(), binding: OtpBinding()),
  GetPage(name: Routes.details, page: () => DetailView(), binding: DetailBinding()),
  GetPage(name: Routes.apiform, page: () => RegisterView(), binding: RegisterBinding()),
];
