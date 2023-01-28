import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visiter_app/feature/reasy_to_task/controller/ready_task_controller.dart';

class ReadyToTaskView extends GetView<ReadyToTaskController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: Container(
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
                              height: Get.height * 0.17,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        11, 0, 15, 0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  const Text(
                                    'READY TO TASK',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/Image/login screen.png',
                              height: 80,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Get.height * .05,
                      left: Get.width * .05,
                      width: Get.width * .9,
                      height: Get.height * .6,
                      child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Task Title",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                    Text(controller.tempMap['priority'],
                                        style: TextStyle(
                                            color: controller
                                                        .tempMap['priority'] ==
                                                    "High"
                                                ? Colors.red
                                                : controller.tempMap[
                                                            'priority'] ==
                                                        "Medium"
                                                    ? Colors.yellow[700]
                                                    : Colors.green,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(controller.tempMap['title'],
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18)),
                                Row(children: <Widget>[
                                  Expanded(
                                    child: new Container(
                                        child: Divider(
                                      color: Colors.grey,
                                      height: 30,
                                    )),
                                  ),
                                ]),
                                Text("Description",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(controller.tempMap['description'],
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18)),
                                Row(children: <Widget>[
                                  Expanded(
                                    child: new Container(
                                        child: Divider(
                                      color: Colors.grey,
                                      height: 30,
                                    )),
                                  ),
                                ]),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Task Start Date",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      width: 120,
                                      child: TextFormField(
                                        //  controller: _Datecontroller,
                                        cursorColor: Colors.white,
                                        style: GoogleFonts.montserrat(
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          labelText: " Start Date",
                                          suffixIcon: Icon(
                                            Icons.calendar_month_outlined,
                                            color: Colors.black,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.black),
                                          ),
                                          fillColor: Colors.black,
                                          labelStyle: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 10,
                                          ),
                                        ),
                                        initialValue:
                                            controller.selectedDate.toString(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.3,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: BeveledRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.indigo))),
                                        child: Text("CANCEL",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: Get.height * 0.015)),
                                        onPressed: () {
                                          Get.back();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.3,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.indigo,
                                            shape: BeveledRectangleBorder()),
                                        child: Text("READY TO TASK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Get.height * 0.015)),
                                        onPressed: () {
                                          controller.gotoInprogress(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
