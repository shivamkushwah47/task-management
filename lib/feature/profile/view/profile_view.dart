import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/feature/profile/controller/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: Get.height,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: Get.width,
                      height: Get.height * 0.45,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.blue, Colors.indigo]),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.17,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      11, 0, 15, 0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                Text(
                                  'PROFILE',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Get.height * 0.035,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/Image/profile.png',
                            height: 90,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Get.height * .05,
                    width: Get.width * 1,
                    height: Get.height * .6,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),

                      //  widget ListProfile(String text1, String text2){
                      // return Container(
                      // const SizedBox(width: 24,),
                      // ListProfile(String text1, String text2){
                      //   Container(

                      child: Padding(
                        padding: EdgeInsets.fromLTRB(40, 50, 10, 10),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: Get.height * 0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                      // height: Get.height * 0.17,
                                      child: Image.asset(
                                    'assets/Image/Profileimage.png',
                                    height: Get.height * 0.075,
                                  )),
                                ],
                              ),
                              Text(
                                FireBase.userInfo['name'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Get.height * 0.025,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              Text(
                                "Designation",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: Get.height * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Text(
                                FireBase.userInfo['role'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Get.height * 0.025,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              Text(
                                "Phone number",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: Get.height * 0.045,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Text(
                                FireBase.userInfo['phone'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Get.height * 0.025,
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
