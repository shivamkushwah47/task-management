import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
import 'package:visiter_app/feature/admin_AllTask_page/controller/All_Task_controller.dart';


class AllTaskView extends GetView<AllTaskController> {
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
              '',
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
      ),     // appBar: CalendarAppBar(
     //
     //      backButton: false,
     //      onDateChanged: (value) => print(value),
     //
     //      firstDate: DateTime.now().subtract(Duration(days: 140)),
     //      lastDate: DateTime.now(),
     //    ),


      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(

            child: Column(
              children: [
                CalendarAppBar(
                  // white: Colors.black,
                  // black: Colors.red,
                  // accent: Colors.green,

                  backButton: false,

                  onDateChanged: (value) => print(value),
                  // white: Colors.blueAccent,

                  firstDate: DateTime.now().subtract(Duration(days: 140)),
                  lastDate: DateTime.now(),

                ),
                Column(
                  children: [
                    Padding(
                      padding:EdgeInsetsDirectional.fromSTEB(5, 0,5, 8) ,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("All Task",style: TextStyle(fontSize: Get.height*0.025,fontWeight: FontWeight.bold)),
                          Text("Priority",style: TextStyle(fontSize: Get.height*0.015,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),



                    Container(
                      width: Get.width * 0.95,


                      margin: EdgeInsets.only(top: 10),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              height: Get.height * 0.09,
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
                                      'Login page',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Get.height * 0.017,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),





                                    Text(
                                      "Description",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: Get.height * 0.012,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "30/01/2023",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: Get.height * 0.012,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                  ],
                                ),
                                Expanded(child: Container()),
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


              ],
            ),
          ),
        ),
      ),
    );
  }
}
