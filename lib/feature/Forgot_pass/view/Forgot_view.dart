import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../controller/Forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
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
                        height: Get.height * 0.45,
                        decoration: const BoxDecoration(
                          gradient:
                          LinearGradient(colors: [Colors.blue, Colors.indigo]),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Colors.red,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.15,
                              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(11, 0, 15, 0),

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
                                    'FORGOT PASSWORD',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),

                            Image.asset(
                              'assets/Image/forgot_password.png',
                              height: 90,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Get.height * .08,
                      left: Get.width * .05,
                      width: Get.width * .9,
                      height: Get.height * .6,
                      child: Card(
                          elevation: 10,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Form(
                                    key: controller.forgetFormKey,
                                    child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Don't worry It Happens.Please enter the\naddress associated with your account.",style: TextStyle(color: Colors.grey, fontSize: Get.height*0.0165),),
                                    ),
                                    SizedBox(height:Get.height*0.05),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.email,color: Colors.black,),
                                        fillColor: Colors.grey.shade200,
                                        hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                        filled: true,
                                        hintText: "Enter Email",
                                        focusedBorder:  OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: BorderSide( width: 0,color: Colors.transparent

                                          ),),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(30),
                                            borderSide: BorderSide( width: 0,color: Colors.transparent
                                            )


                                        ),

                                      ),
                                      controller: controller.emailController,
                                      onSaved: (value) {
                                        controller.email = value!;
                                      },
                                      validator: (value) {
                                        controller.isValid(value, 'Please Enter email');
                                      },
                                    ),
                                    SizedBox(height:Get.height*0.05),
                                    SizedBox(
                                      width: Get.width*0.6,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.indigo
                                        ),
                                          onPressed: () {controller.signupformvalid();},
                                          child: Text('SUBMIT',style: TextStyle(color: Colors.white),)

                                      ),
                                    )

                                  ],
                                ))
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
