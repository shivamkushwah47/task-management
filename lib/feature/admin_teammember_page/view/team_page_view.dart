import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
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
              'TEAM MEMBER ',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.height * 0.030,
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
                            children: [

                            ],
                          ),

                        ),
                        Image.asset(
                          'assets/Image/Teammenber.png',
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.AddTeamMember);
                                  },
                                  child: const Text('Add New Member',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                ),
                              ],
                            ),
                            StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("mytask/mytask/users")
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text('Something went wrong');
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                if (snapshot.connectionState ==
                                    ConnectionState.active) {
                                  if (snapshot.hasData &&
                                      snapshot.data != null) {

                                    return Expanded(
                                      child: ListView.builder(
                                          itemCount: snapshot.data!.docs.length,
                                          itemBuilder: (context, index) {
                                            Map<String, dynamic> usersmap =
                                            snapshot.data!.docs[index]
                                                .data()
                                            as Map<String, dynamic>;

                                            return ListTile(
                                              tileColor: Colors.grey,
                                              onTap: (){


                                              },
                                              title: Text(usersmap["name"]),
                                              subtitle: Text(usersmap["email"]),
                                              trailing: IconButton(
                                                icon: Icon(Icons.more_vert),
                                                onPressed: () {  },
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
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            )
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
