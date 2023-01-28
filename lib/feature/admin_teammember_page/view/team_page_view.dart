import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/feature/admin_teammember_page/controller/team_page_controller.dart';

class TeamView extends GetView<TeamController> {
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
          'Team Member',
          style: TextStyle(
              color: Colors.white,
              fontSize: Get.height*0.030,
              fontWeight: FontWeight.w400),
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
                        height: Get.height * 0.05,
                        child: Row(
                          children: [


                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/Image/Teammenber.png',
                        height: Get.height*0.115,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: Get.height * .04,
                  width: Get.width * 1,
                  height: Get.height * .6,
                  child: Container(padding: EdgeInsetsDirectional.fromSTEB(25, 15, 25, 0) ,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),

                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [ TextButton(
                            onPressed: (){
                              Get.toNamed(Routes.AddTeamMember);
                            },
                            child: const Text('Add New Member',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.indigo)),
                          ),
                          ],
                        ),
                        Container(
                          width: Get.width * 0.95,
                          // margin: EdgeInsets.only(top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  height: Get.height * 0.095,
                                  //padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(children: [
                                    SizedBox(
                                      width: Get.width * 0.06,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Name',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: Get.height * 0.017,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Email Id",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: Get.height * 0.012,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "Phone Number",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: Get.height * 0.012,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),

                                      ],
                                    ),
                                    Expanded(child: Container()),
                                    Image.asset(
                                      'assets/Image/Profileimage.png',
                                      height: Get.height*0.07,
                                    ),
                                    IconButton(onPressed:(){} , icon: Icon(Icons.more_vert_outlined),iconSize: 30,color: Colors.black,),
                                    SizedBox(width:Get.width*0.02,)
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),



                  )
              )



            ],
          ),
        ),
      ],
    ),
  ),



);  }
}