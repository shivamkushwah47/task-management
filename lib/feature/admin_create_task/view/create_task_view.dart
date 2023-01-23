import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:visiter_app/feature/admin_create_task/controller/create_task_controller.dart';

class CreateTaskView extends GetView<CreateTaskController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      resizeToAvoidBottomInset : false,

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
                        height: Get.height * 0.35,
                        decoration: const BoxDecoration(
                          gradient:
                          LinearGradient(colors: [Colors.blue, Colors.indigo]),
                          // borderRadius: BorderRadius.only(
                          //     bottomLeft: Radius.circular(30),
                          //     bottomRight: Radius.circular(30)),
                           color: Colors.red,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.15,
                              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(11, 0, 15, 0),
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
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Get.height * .08,
                      left: Get.width * .05,
                      width: Get.width * .9,
                      height: Get.height * .55,
                      child: Container(

                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: [
                                Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Container(width: 100,
                                      child: TextFormField(
                                      //  controller: _Datecontroller,
                                        cursorColor: Colors.white,
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          labelText: " Start Date",
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                             // _selectDate(context);
                                            },
                                            child: Icon(
                                              Icons.calendar_month_outlined,
                                              color: Colors.black,
                                            ),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black),
                                          ),
                                          fillColor: Colors.black,
                                          labelStyle: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(width: 90,
                                      child: TextFormField(
                                        onTap: (){
                                          controller.date();
                                        },
                                        //  controller: _Datecontroller,
                                        cursorColor: Colors.white,
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          labelText: " End Date",
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              // _selectDate(context);
                                            },
                                            child: Icon(
                                              Icons.calendar_month_outlined,
                                              color: Colors.black,
                                            ),
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black),
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
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 50),
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
                                  ),
                                ),
Padding(
  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
  child:   Text("Are you ready to create a task",style: TextStyle(fontWeight:FontWeight.bold ),),
),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(

                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.indigo,
                                          shape:BeveledRectangleBorder()),
                                      child: Text("CANCEL",
                                          style: TextStyle(color: Colors.white, fontSize:Get.height*0.025)),
                                      onPressed: () {
                                        },
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.indigo,
                                          shape:BeveledRectangleBorder()),
                                      child: Text("CREATE TASK",
                                          style: TextStyle(color: Colors.white, fontSize:Get.height*0.025)),
                                      onPressed: () {
                                      },

                                    ),
                                  ],
                                ),                              ],
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
    );  }
}