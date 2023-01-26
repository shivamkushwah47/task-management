import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:visiter_app/feature/setting/controller/seting_controller.dart';

import '../../../core/global/colors.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //  throw UnimplementedError();

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
                        color: Colors.red,
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
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.menu,
                                        size: 30,
                                        color: Colors.white,
                                      )),
                                ),
                                const Text(
                                  'SETTINGS',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/Image/setting.png',
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
                      padding: EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height:Get.height*0.035 ,
                          ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: 40,

                              ),

                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "  Profile",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: "Montserrat",
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "   Manage your Profile",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: "Montserrat",
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: Container()),

                              SizedBox(
                                child: (CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 30,
                                        color: Colors.grey,
                                      )),
                                )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height*0.035,
                          ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.lock,
                                color: Colors.grey,
                                size: 40,

                              ),
                              Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "  Password",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: "Montserrat",
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "   Change Password",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: "Montserrat",
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(child: Container()),
                              SizedBox(
                                child: (CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 30,
                                        color: Colors.grey,
                                      )),
                                )),
                              ),
                            ],
                          ),
                        ],
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
