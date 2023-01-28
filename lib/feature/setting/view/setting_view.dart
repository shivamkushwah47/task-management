import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/feature/setting/controller/seting_controller.dart';


class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(FireBase.userInfo['name']),
              accountEmail: Text("abc@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/dp.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notification"),
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text("Delete Account"),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log out"),
            )
          ],
        ),
      ),

      appBar: AppBar(
        centerTitle: true,
        title:  Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SETTINGS',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.height*0.030,
                  fontWeight: FontWeight.w500),
            ),

          ],
        ),
        elevation: 0,
        flexibleSpace: Container(

          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.blue,
                    Colors.indigo
                  ])
          ),
        ),
      ),

      resizeToAvoidBottomInset: false,
      body: Container(
        //height: Get.height,
        child: Column(
          children: [
            SizedBox(
              height: Get.height*0.9,
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
                            height: Get.height * 0.08,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

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
                    bottom: 0,
                    width: Get.width * 1,
                    height: Get.height * .55,
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
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(Routes.profile);
                            },
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.grey,
                                  size: Get.height*0.05,

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
                                        fontSize: Get.height*0.028,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "   Manage your Profile",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "Montserrat",
                                        fontSize: Get.height*0.018,
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
                                        icon:  Icon(
                                          Icons.arrow_forward_ios,
                                          size: Get.height*0.038,
                                          color: Colors.grey,
                                        )),
                                  )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height*0.035,
                          ),

                          GestureDetector(
                            onTap: (){
                              Get.toNamed(Routes.ChangePass);
                            },
                            child: Row(

                              mainAxisAlignment:
                                  MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.lock,
                                  color: Colors.grey,
                                  size: Get.height*0.05,

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
                                        fontSize: Get.height*0.028,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "   Change Password",
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "Montserrat",
                                        fontSize: Get.height*0.018,
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
                                        onPressed: () {
                                          Get.offAllNamed(Routes.ChangePass);
                                        },
                                        icon:  Icon(
                                          Icons.arrow_forward_ios,
                                          size: Get.height*0.038,
                                          color: Colors.grey,
                                        )),
                                  )),
                                ),
                              ],
                            ),
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
