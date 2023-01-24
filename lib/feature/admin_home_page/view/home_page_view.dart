import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';
import 'package:visiter_app/feature/admin_home_page/controller/home_page-controller.dart';

import '../../../core/firebase/firebase.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => controller.loader.value
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(

      // appBar: AppBar(
      //   elevation: 0,
      //   /* backgroundColor: Colors.transparent,*/
      //   titleSpacing: 50,
      //   leading: CircleAvatar(
      //       radius: 25,
      //       backgroundImage: AssetImage('assets/Image/forgot_password.png')),
      //   actions: [
      //     SizedBox(
      //       width: 10,
      //     ),
      //     Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text('Name Surname',
      //             style: TextStyle(
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: Get.height * 0.024)),
      //         Text(
      //           "Designation",
      //           style: TextStyle(color: Colors.grey),
      //         ),
      //       ],
      //     ),
      //     IconButton(
      //         onPressed: () {},
      //         icon: const Icon(
      //           Icons.notifications,
      //           size: 25,
      //         )),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            size: 35,
                          )),
                      CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage('assets/Image/forgot_password.png')),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(FireBase.userInfo['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Get.height * 0.024)),
                          Text(
                            "Designation",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              size: 25,
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 20),
                      child: Text('Project',
                          style: TextStyle(
                              fontSize: Get.height * 0.035,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(
                            left: 0, right: 22, top: 0, bottom: 0),
                        width: Get.width * 0.4,
                        height: Get.height * 0.3,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,

                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("5 Task",
                                    style: TextStyle(
                                        fontSize: Get.height * 0.029,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 10),
                                  child: Text("UI Design",
                                      style: TextStyle(
                                          fontSize: Get.height * 0.029,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("08/01/2023",
                                    style: TextStyle(
                                        fontSize: Get.height * 0.015,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                            colors: [
                              Colors.indigo,
                              Colors.blue,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(
                            left: 0, right: 22, top: 0, bottom: 0),
                        width: Get.width * 0.42,
                        height: Get.height * 0.3,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,

                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("5 Task",
                                    style: TextStyle(
                                        fontSize: Get.height * 0.029,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 10),
                                  child: Text("UI Design",
                                      style: TextStyle(
                                          fontSize: Get.height * 0.029,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("08/01/2023",
                                    style: TextStyle(
                                        fontSize: Get.height * 0.015,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          gradient: LinearGradient(
                            colors: [
                              Colors.indigo,
                              Colors.blue,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 5),
                      child: Text('All Task',
                          style: TextStyle(
                              fontSize: Get.height * 0.035,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Container(
                  width: Get.width * 0.95,

                  //margin: EdgeInsets.fromLTRB(, , right, bottom),

                  margin: EdgeInsets.only(top: 10),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: Get.height * 0.09,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(children: [
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: const Icon(Icons.abc,
                                    color: Colors.indigo)),
                            SizedBox(
                              width: Get.width * 0.06,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Todo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.height * 0.025,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "10 Task",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.015,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "-",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.015,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "1 Started",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.015,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Get.width * 0.95,

                  //margin: EdgeInsets.fromLTRB(, , right, bottom),

                  margin: EdgeInsets.only(top: 10),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: Get.height * 0.09,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.purpleAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(children: [
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: const Icon(Icons.abc,
                                    color: Colors.indigo)),
                            SizedBox(
                              width: Get.width * 0.06,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'In Progress',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.height * 0.025,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "10 Task",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.015,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "-",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.015,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "8 In Progress",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.015,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: Get.width * 0.95,

                  //margin: EdgeInsets.fromLTRB(, , right, bottom),

                  margin: EdgeInsets.only(top: 10),

                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: Get.height * 0.09,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(children: [
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: const Icon(Icons.abc,
                                    color: Colors.indigo)),
                            SizedBox(
                              width: Get.width * 0.06,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Done',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.height * 0.025,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "10 Task",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.015,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "-",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.015,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "8 Done",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height * 0.015,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
