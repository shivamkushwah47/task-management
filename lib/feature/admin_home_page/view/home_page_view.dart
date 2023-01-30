import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';
//import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:visiter_app/Core/routes.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
import 'package:visiter_app/feature/admin_home_page/controller/home_page-controller.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(
      () => controller.loader.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Colors.white,
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      accountName: Text(FireBase.userInfo['name']),
                      accountEmail: Text(FireBase.userInfo['email']),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage('assets/Image/Profileimage.png'),
                      ),
                    ),
                    ListTile(
                      onTap: (){
                        Get.toNamed(Routes.Notification);
                      },
                      leading: Icon(Icons.notifications),
                      title: Text("Notification"),
                    ),
                    ListTile(
                      onTap: (){
                        controller.deleteUser(FireBase.userInfo['id'],context);

                      },
                      leading: Icon(Icons.lock),
                      title: Text("Delete Account"),
                    ),
                    ListTile(
                      onTap: (){
                       controller.Logout();
                      },
                      leading: Icon(Icons.logout),
                      title: Text("Log out"),
                    )
                  ],
                ),
              ),
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                centerTitle: true,
                title: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              AssetImage('assets/Image/Profileimage.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(FireBase.userInfo['name'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Get.height * 0.028)),
                          Text(
                            FireBase.userInfo['role'],
                            style: TextStyle(
                                color: Colors.grey, fontSize: Get.height * 0.018),
                          )
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.Notification);
                          },
                          icon: const Icon(
                            Icons.notifications,
                            size: 25,
                          )),
                    ),
                  ],
                ),
                elevation: 0,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[Colors.white, Colors.white])),
                ),
              ),
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 0, 20),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("5 Task",
                                            style: TextStyle(
                                                fontSize: Get.height * 0.029,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 10),
                                          child: Text("UI Design",
                                              style: TextStyle(
                                                  fontSize: Get.height * 0.025,
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
                                    SizedBox(
                                      height: Get.height*0.05,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                      Text("Progress",style: TextStyle(color: Colors.white,fontSize: Get.height * 0.017,),),
                                      Text("50%",style: TextStyle(color: Colors.white,fontSize: Get.height * 0.017,),)
                                      ],
                                    ),
                                    LinearProgressIndicator(
                                      value:0.5,
                                      backgroundColor: Colors.white,
                                      minHeight: Get.height*0.01,
                                      color: Colors.green,

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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("5 Task",
                                            style: TextStyle(
                                                fontSize: Get.height * 0.029,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 10),
                                          child: Text("UI Design",
                                              style: TextStyle(
                                                  fontSize: Get.height * 0.025,
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
                                    SizedBox(
                                      height: Get.height*0.05,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                        Text("Progress",style: TextStyle(color: Colors.white,fontSize: Get.height * 0.017,),),
                                        Text("65%",style: TextStyle(color: Colors.white,fontSize: Get.height * 0.017,),)
                                      ],
                                    ),
                                    LinearProgressIndicator(
                                      value:0.65,
                                      backgroundColor: Colors.white,
                                      minHeight: Get.height*0.01,
                                      color: Colors.green,

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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 20, 0, 5),
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

                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.TodoPage);
                            },
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
                                          child: const Icon(Icons.toc,
                                              color: Colors.indigo)),
                                      SizedBox(
                                        width: Get.width * 0.06,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                        ),
                        Container(
                          width: Get.width * 0.95,

                          //margin: EdgeInsets.fromLTRB(, , right, bottom),

                          margin: EdgeInsets.only(top: 10),

                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.InProgressPage);
                            },
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
                                          child: const Icon(Icons.cached_rounded,
                                              color: Colors.indigo)),
                                      SizedBox(
                                        width: Get.width * 0.06,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                        ),
                        Container(
                          width: Get.width * 0.95,

                          //margin: EdgeInsets.fromLTRB(, , right, bottom),

                          margin: EdgeInsets.only(top: 10),

                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.donePage);
                            },
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
                                          child: const Icon(Icons.done,
                                              color: Colors.indigo)),
                                      SizedBox(
                                        width: Get.width * 0.06,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
