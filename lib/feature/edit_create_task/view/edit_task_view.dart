import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
import 'package:visiter_app/feature/edit_create_task/Controller/edit_task_controller.dart';

class EditTaskView extends GetView<EditTaskController> {
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
                              height: Get.height * 0.15,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        11, 0, 15, 0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  const Text(
                                    'Edit Task',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/Image/otp.png',
                              height: 90,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Get.height * 0,
                      width: Get.width,
                      height: Get.height * .7,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(30, 10, 30, 10),
                          child: Form(
                            key: controller.editFormKey,
                            child: Column(children: [
                              TextFormField(
                                cursorColor: Colors.grey,
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Title",
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

                                validator: controller.requiredValidator,
                                controller: controller.titlecontroller,
                                onChanged: (value) {
                                  controller.taskTitle = value;
                                },
                              ),
                              TextFormField(
                                // controller: _Titlecontroller,
                                cursorColor: Colors.black,
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Description",
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

                                validator: controller.requiredValidator,
                                controller: controller.desccontroller,
                                onChanged: (value) {
                                  controller.taskDesc = value;
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: 100,
                                      child: DropdownSearch<String>(
                                        popupProps: PopupProps.menu(
                                          showSelectedItems: true,
                                          disabledItemFn: (String s) =>
                                              s.startsWith('I'),
                                        ),
                                        items:
                                            FireBase.userInfo['role'] == "admin"
                                                ? controller.Alluser
                                                : controller.userlist,
                                        dropdownDecoratorProps:
                                            DropDownDecoratorProps(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                            labelText: "Asignee",
                                            hintText: "select name",
                                          ),
                                        ),
                                        selectedItem:
                                            controller.dataFromTodo['asignee'],
                                        onChanged: (value) {
                                          controller.selecteduser = value;
                                        },
                                      )),
                                  SizedBox(
                                    width: 100,
                                    child: DropdownSearch<String>(
                                      popupProps: PopupProps.menu(
                                        showSelectedItems: true,
                                      ),
                                      items: controller.priorityItems,
                                      dropdownDecoratorProps:
                                          DropDownDecoratorProps(
                                        dropdownSearchDecoration:
                                            InputDecoration(
                                          labelText: "Priority",
                                          hintText: "choose priority",
                                        ),
                                      ),
                                      selectedItem:
                                          controller.dataFromTodo['priority'],
                                      onChanged: (value) {
                                        controller.selectedPriority = value;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              TextFormField(
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

                                validator: controller.requiredValidator,
                                controller: controller.summarycontroller,
                                onChanged: (value) {
                                  controller.tasksummary = value;
                                },
                              ),
                              SizedBox(
                                height: Get.height * 0.035,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.31,
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
                                    width: Get.width * 0.30,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.indigo,
                                          shape: BeveledRectangleBorder()),
                                      child: Text("Update",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Get.height * 0.025)),
                                      onPressed: () {
                                        controller.updateTask(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ),
                      ),
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
