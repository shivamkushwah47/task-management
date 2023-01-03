import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:visiter_app/feature/otpdetail/Controller/otp_detail_controller.dart';
import 'package:visiter_app/feature/signup/controller/signup_controller.dart';

class OtpDetail extends GetView<OtpDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(

        child: SingleChildScrollView(
          child: Container(
            width: 350,
            height: Get.height,
            child: Column(
              children: [

                SizedBox(
                  height: 30,
                ),

                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Enter Details",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                Form(
                  key: controller.SignupFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            // labelText: "Name",
                            hintText: "Enter Name",
                            border: OutlineInputBorder(),
                          ),
                          controller: controller.NameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            // labelText: "Name",
                            hintText: "Enter Email Id",
                            border: OutlineInputBorder(),
                          ),
                          controller: controller.emailIdController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your Email';
                            }
                            return null;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            // labelText: "Name",
                            hintText: "Enter Phone Number",
                            border: OutlineInputBorder(),
                          ),
                          controller: SignupController.phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter contact Number';
                            }
                            return null;
                          },
                        ),
                      ),Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            // labelText: "Name",
                            hintText: "Enter Your Password",
                            border: OutlineInputBorder(),
                          ),
                          controller: controller.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Your password please';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 100,),
                      SizedBox(
                        height: 54,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                elevation: 3,
                                shape: StadiumBorder(),
                                padding: EdgeInsets.all(
                                    8) //content padding inside button
                            ),
                            onPressed: () {
                              controller.addUser();
                            },
                            child: Text("Submit",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
