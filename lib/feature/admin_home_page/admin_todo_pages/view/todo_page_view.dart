
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/feature/admin_home_page/admin_todo_pages/controller/todo_page_controller.dart';


class TodoView extends GetView<TodoController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
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
                            height: Get.height * 0.15,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 10, 0),
                                  child: CircleAvatar( backgroundColor: Colors.white,
                                    child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back_ios_rounded,

                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                const Text(
                                  'To Do',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/Image/todo.png',
                            height: Get.height * 0.115,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: Get.height * .35,
                      width: Get.width * 1,
                      height: 450,
                      child: Container(
                        padding: EdgeInsetsDirectional.fromSTEB(25, 20, 25, 0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 5, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Created Task",
                                      style: TextStyle(
                                          fontSize: Get.height * 0.025,
                                          fontWeight: FontWeight.bold)),
                                  Text("Priority",
                                      style: TextStyle(
                                          fontSize: Get.height * 0.015,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            StreamBuilder(
                              stream: FireBase.userInfo['role']=="admin"?controller.todosnapshota:controller.todosnapshotu,
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
                                            Map<String, dynamic> todomap =
                                                snapshot.data!.docs[index]
                                                        .data()
                                                    as Map<String, dynamic>;

                                            return ListTile(

                                              tileColor: Colors.grey,
                                              onTap: () {
                                                Get.toNamed(Routes.readyToTask, arguments: [index,todomap]);

                                              },
                                              title: Text(todomap["title"]),
                                              subtitle: Text(todomap["report"]),
                                              trailing: IconButton(
                                                icon: Icon(Icons.more_vert),
                                                onPressed: () {
                                                  FireBase.userInfo["role"]=="admin"?
                                                  Get.toNamed(Routes.EditTask, arguments: [index,todomap]):null;
                                                },
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
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
