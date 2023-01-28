import 'package:cloud_firestore/cloud_firestore.dart';
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
              accountEmail: Text(FireBase.userInfo['email']),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/Image/Profileimage.png'),
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
        title: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SETINGS',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.height * 0.030,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.blue, Colors.indigo])),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: Container(
          child: SizedBox(
            height: Get.height,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: Get.width,
                    height: Get.height * 0.4,
                    decoration: const BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.indigo]),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.06,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [],
                          ),
                        ),
                        Image.asset(
                          'assets/Image/setting.png',
                          height: Get.height * 0.115,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * .28,
                  width: Get.width * 1,
                  height: Get.height * .690,
                  child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.005,
                            ),

                            ListTile(
                              leading: Icon(Icons.person,size: 35),
                              title: Text("Profile",style: TextStyle(fontSize: 20)),
                              subtitle: Text("Manage your Profile",style: TextStyle(fontSize: 15)),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: (){
                                Get.toNamed(Routes.profile);

                              },

                            ),
                            ListTile(
                              leading: Icon(Icons.lock,size: 35),
                              title: Text("Password",style: TextStyle(fontSize: 20)),
                              subtitle: Text("Change your password",style: TextStyle(fontSize: 15)),
                              trailing: Icon(Icons.arrow_forward_ios),
                              onTap: (){
                                Get.toNamed(Routes.ChangePass);
                              },

                            ),


                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
