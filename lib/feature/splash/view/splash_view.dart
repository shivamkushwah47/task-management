import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:visiter_app/feature/Introduction/view/introduction_view.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnimatedSplashScreen(

          splash: Image.asset("assets/Icon/splash.gif"
            ,),
          splashIconSize: 350,
          nextScreen: IntroView(),
          splashTransition: SplashTransition.slideTransition,
          backgroundColor: Colors.white,
          duration: 3000,

        )
      ),
    );
  }
}
