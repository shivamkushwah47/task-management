import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:visiter_app/Core/routes.dart';
import 'package:visiter_app/feature/Introduction/controller/introduction_controller.dart';

class IntroView extends GetView<IntroController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: IconButton(
            //       onPressed: () {},
            //       color: Colors.black87,
            //       icon: Icon(Icons.arrow_back_ios)),
            // ),
            // InkWell(
            //   child: Text(
            //     "Skip",
            //     style: TextStyle(fontSize: 20, color: Colors.black87),
            //   ),
            //   onTap: () => Get.toNamed(Routes.dashboard),
            // )
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: IntroductionScreen(
          pages: [
            PageViewModel(
                title: "WORK TOGETHER",
                image: Image.asset('assets/Image/introduction1.png'),
                bodyWidget: Column(
                  children: [
                    Text(
                      'Simply Collaborate with your team wherever you are',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: StadiumBorder()),
                      child: Text("GET STARTED",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onPressed: () { Get.toNamed(Routes.login);},
                    )
                  ],
                ),

                decoration: PageDecoration( titleTextStyle: TextStyle(color: Colors.purple,fontSize: 22, fontWeight: FontWeight.bold),)),
            PageViewModel(
                title: "GET ORGANIZED",
                image: Image.asset('assets/Image/introduction2.jpg'),

                bodyWidget: Column(
                  children: [
                    Text(
                      'Stay on top of your work',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),


                    SizedBox(
                      height: 92,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: StadiumBorder()),
                      child: Text("GET STARTED",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onPressed: () {Get.toNamed(Routes.login);},
                    )
                  ],
                ),
                decoration: PageDecoration(titleTextStyle: TextStyle(color: Colors.purple,fontSize: 22, fontWeight: FontWeight.bold),)),
            PageViewModel(

                title: "SIMPLY",
                image: Image.asset('assets/Image/introduction3.jpg'),
                bodyWidget: Column(
                  children: [
                    Text(
                      'Ubi task keeps it simple and lets you focus on your work',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: StadiumBorder()),
                      child: Text("GET STARTED",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onPressed: () {Get.toNamed(Routes.login);},
                    )
                  ],
                ),
                decoration: PageDecoration(titleTextStyle: TextStyle(color: Colors.purple,fontSize: 22, fontWeight: FontWeight.bold),)),
          ],
          onDone: () {
            // For skip the Inroduction Screen
            Get.toNamed(Routes.login);
          },
          autoScrollDuration: 3000,
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          showBackButton: false,
          skip: Text(
            '',
            style: TextStyle(color: Colors.black),
          ),
          next:
              const Text("", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
          done: const Text("",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          dotsDecorator: const DotsDecorator(
            size: Size(18.0, 10.0),
            //size of dots
            color: Colors.grey,
            //color of dots
            activeSize: Size(18.0, 10.0),
            activeColor: Color(0xff4C00B0),
            //color of active dot
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            shape: RoundedRectangleBorder(
              //shape of active dot
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),


        ),






      ),






    );
  }
}
