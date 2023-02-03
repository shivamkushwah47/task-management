import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/utils.dart';
import 'package:visiter_app/Core/routes.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
import 'package:visiter_app/feature/admin_AllTask_page/controller/All_Task_controller.dart';

class AllTaskView extends GetView<AllTaskController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => Scaffold(
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
        centerTitle: true,
        title: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.height * 0.030,
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
              ])),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              CalendarAppBar(
                // white: Colors.black,
                // black: Colors.red,
                // accent: Colors.green,
                // white: Colors.blueAccent,
                selectedDate: DateTime.now(),
                backButton: false,
                onDateChanged: (value)  {
                  AllTaskController.selectedDate.value = value.toString();
                  print(value);
                  },
                firstDate: DateTime.now().subtract(Duration(days: 140)),
                lastDate: DateTime.now(),

              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("All Task",
                        style: TextStyle(
                            fontSize: Get.height * 0.025,
                            fontWeight: FontWeight.bold)),
                    Text("Priority",
                        style: TextStyle(
                            fontSize: Get.height * 0.019,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              StreamBuilder(
                stream: FireBase.userInfo['role'] == "admin"
                    ? controller.allTaskSnapshota
                    : controller.allTaskSnapshotu,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData && snapshot.data != null) {
                      print("AllTaskController.selectedDate");
                      print(AllTaskController.selectedDate);
                      return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> allTaskmap =
                                  snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>;

                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  tileColor: Colors.white,
                                  title: Text(allTaskmap["title"]),
                                  subtitle: Text(allTaskmap["description"]),
                                  trailing: Icon(Icons.more_vert),
                                ),
                              );
                            }),
                      );
                    } else {
                      return Text(
                        "No Data",
                        style: TextStyle(color: Colors.blue),
                      );
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
