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
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  onPressed: () {},
                  color: Colors.black87,
                  icon: Icon(Icons.arrow_back_ios)),
            ),
            InkWell(
              child: Text(
                "Skip",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
              onTap: () => Get.toNamed(Routes.dashboard),
            )
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
                title: "PLANNING",
                image: Image.asset('assets/Image/visitor-management.jpg'),
                bodyWidget: Column(
                  children: [
                    Text(
                      'Lorem ipsum is simply dummy text of the printing and typesetting industry',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff255DEC),
                          shape: StadiumBorder()),
                      child: Text("Next",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onPressed: () {},
                    )
                  ],
                ),
                decoration: PageDecoration()),
            PageViewModel(
                title: "STARTUP",
                image: Image.asset('assets/Image/visitor-management.jpg'),
                bodyWidget: Column(
                  children: [
                    Text(
                      'Lorem ipsum is simply dummy text of the printing and typesetting industry',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff255DEC),
                          shape: StadiumBorder()),
                      child: Text("Next",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onPressed: () {},
                    )
                  ],
                ),
                decoration: PageDecoration()),
            PageViewModel(
                title: "SUCCESS",
                image: Image.asset('assets/Image/visitor-management.jpg'),
                bodyWidget: Column(
                  children: [
                    Text(
                      'Lorem ipsum is simply dummy text of the printing and typesetting industry',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff255DEC),
                          shape: StadiumBorder()),
                      child: Text("Next",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onPressed: () {},
                    )
                  ],
                ),
                decoration: PageDecoration()),
          ],
          onDone: () {
            // For skip the Inroduction Screen
            Get.toNamed(Routes.dashboard);
          },
          autoScrollDuration: 2000,
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          showBackButton: false,
          skip: Text(
            'Skip',
            style: TextStyle(color: Colors.black),
          ),
          next:
              const Text("Next", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600)),
          done: const Text("Done",
              style: TextStyle(color: Colors.black, fontSize: 16)),
          dotsDecorator: const DotsDecorator(
            size: Size(18.0, 10.0),
            //size of dots
            color: Colors.grey,
            //color of dots
            activeSize: Size(18.0, 10.0),
            activeColor: Color(0xffFFD600),
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
