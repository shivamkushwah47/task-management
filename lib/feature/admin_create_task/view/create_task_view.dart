import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visiter_app/feature/admin_create_task/controller/create_task_controller.dart';

class CreateTaskView extends GetView<CreateTaskController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                      // borderRadius: BorderRadius.only(
                      //     bottomLeft: Radius.circular(30),
                      //     bottomRight: Radius.circular(30)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.15,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 15, 0),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                    )),
                              ),
                              const Text(
                                'Create New Task',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: TextFormField(
                            // controller: _Titlecontroller,
                            cursorColor: Colors.white,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              labelText: "Title",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              fillColor: Colors.white,
                              labelStyle: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            controller: controller.titlecontroller,
                            onChanged: (value) {
                              controller.taskTitle = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: TextFormField(
                            // controller: _Titlecontroller,
                            cursorColor: Colors.white,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                            decoration: InputDecoration(
                              labelText: "Description",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              fillColor: Colors.white,
                              labelStyle: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            controller: controller.desccontroller,
                            onChanged: (value) {
                              controller.taskDesc = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: Get.height * .35,
                  width: Get.width * 1,
                  height: Get.height * .65,
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
                              height: Get.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    width: 140,
                                    child: DropdownSearch<String>(
                                      popupProps: PopupProps.menu(
                                        showSelectedItems: true,
                                        disabledItemFn: (String s) =>
                                            s.startsWith('I'),
                                      ),
                                      items: controller.Alluser,
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          labelText: "Asignee",
                                          hintText: "select name",
                                        ),
                                      ),
                                      onChanged: (value){
                                        controller.selecteduser = value;
                                      },

                                    )),
                                SizedBox(
                                  width: 140,
                                  child: DropdownSearch<String>(
                                    popupProps: PopupProps.menu(
                                      showSelectedItems: true,
                                    ),
                                    items: controller.priorityItems,
                                    dropdownDecoratorProps:
                                        DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                        labelText: "Priority",
                                        hintText: "choose priority",
                                      ),
                                    ),
                                    onChanged: (value){
                                      controller.selectedPriority = value;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          controller.chooseDate();
                                          // _selectDate(context);
                                        },
                                        child: Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.black,
                                        ),
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
                                Container(
                                  width: 120,
                                  child: TextFormField(
                                    onTap: () {},
                                    //  controller: _Datecontroller,
                                    cursorColor: Colors.white,
                                    style: GoogleFonts.montserrat(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      labelText: " End Date",
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          controller.chooseDate();
                                        },
                                        child: Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.black,
                                        ),
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
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 30, 0, 50),
                              child: TextFormField(
                                // controller: _Titlecontroller,
                                cursorColor: Colors.black,
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Summary",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  fillColor: Colors.black,
                                  labelStyle: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                                controller: controller.summarycontroller,
                                onChanged: (value) {
                                  controller.tasksummary = value;
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                              child: Text(
                                "Are you ready to create a task",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: Get.height * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.4,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.indigo,
                                        shape: BeveledRectangleBorder()),
                                    child: Text("CANCEL",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Get.height * 0.025)),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.4,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.indigo,
                                        shape: BeveledRectangleBorder()),
                                    child: Text("CREATE TASK",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Get.height * 0.025)),
                                    onPressed: () {
                                      controller.gotoCreateTask(context);
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
        ),
      ),
    );
  }
}
