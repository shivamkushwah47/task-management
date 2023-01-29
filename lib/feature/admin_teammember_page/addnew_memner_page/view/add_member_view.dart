import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:visiter_app/core/components/custombutton.dart';
import 'package:visiter_app/core/components/custombuttonsecond.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/feature/admin_teammember_page/addnew_memner_page/controller/add_member_controller.dart';

class AddMemberView extends GetView<AddMemberController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Scaffold(






  resizeToAvoidBottomInset: false,
  body: GestureDetector(onTap:  () => Get.focusScope!.unfocus(),
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
                    height: Get.height * 0.50,
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
                                child: CircleAvatar( backgroundColor: Colors.white,
                                  child: IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: Colors.black,
                                      )),
                                ),
                              ),
                              Text(
                                'ADD NEW MEMBER',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Get.height*0.023,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/Image/addnewmember.png',
                          height: Get.height*0.115,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: Get.height * .10,
                    width: Get.width * 1,
                    height: Get.height * .59,
                    child: Container(padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0) ,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),

                      child:
                      Form(
                        key: controller.AddTeamkey,
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: Get.height*0.025,
                              ),
                              decoration: InputDecoration(
                                labelText: "Name",
                                hintText: "Team member name",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                fillColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: Get.height*0.025,fontWeight: FontWeight.bold
                                ),
                              ),
                              controller: controller.nameController,
                              onChanged: (value) {
                                controller.name = value;
                              },
                              validator: (value) =>
                                  controller.isvalid(value, 'Name'),
                            ),
                            // SizedBox(height: Get.height*0.005,),
                            TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,fontWeight: FontWeight.bold
                              ),
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "member@gmail.com",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                fillColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,fontWeight: FontWeight.bold
                                ),
                              ),
                                onChanged: (value) {
                                  controller.email = value;
                                },
                                validator: controller.EmailValidator

                            ),
                            // SizedBox(height: Get.height*0.015,),
                            TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                labelText: "Password",
                                hintText: "12345",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                fillColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,fontWeight: FontWeight.bold
                                ),
                              ),
                              onChanged: (value) {
                                controller.password = value;
                              },
                              validator: controller.passwordValidator,

                            ),
                            // SizedBox(height: Get.height*0.015,),
                            TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                labelText: "Phone number",
                                hintText: "+918545896321",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                fillColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,fontWeight: FontWeight.bold
                                ),
                              ),

                              controller: controller.phoneController,
                              onChanged: (value) {
                                controller.phone = value;
                              },
                              validator: (value) =>
                                  controller.isvalid(value, 'number'),
                            ),


                            SizedBox(height: Get.height*0.035,),

                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(width: Get.width*0.40,
                                  child:CustomButtonCancel(
                                    title: "CANCEL",
                                    onPress: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                                Container(width: Get.width*0.40,
                                   child:  CustomButton(
                                     title: "ADD",
                                     onPress: () {controller.addmember(context);

                                     },
                                   ),

                                   //ElevatedButton(
                                  //   style: ElevatedButton.styleFrom(
                                  //       backgroundColor: Colors.indigoAccent,
                                  //       shape:BeveledRectangleBorder()),
                                  //   child: Text("CREATE TEAM",
                                  //       style: TextStyle(color: Colors.white, fontSize:Get.height*0.022)),
                                  //   onPressed: () {
                                  //     controller.addmember(context);
                                  //   },
                                  //
                                  // ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),



                    )
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