import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
import 'package:visiter_app/feature/drawer/controller/drawer_controller.dart';


class AppDrawer extends GetView<DrawersController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 280,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(FireBase.userInfo['name']),
                accountEmail: Text(FireBase.userInfo['email']),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/Icon/appicon.png"),
                ),
              ),
              ListTile(
                onTap: (){

                },
                leading: Icon(Icons.notifications),
                title: Text("Notification"),
              ),
              ListTile(
                onTap: (){

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
      ),
    );
  }
}