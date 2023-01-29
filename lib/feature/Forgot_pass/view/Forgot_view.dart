import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../controller/Forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:  Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
              '   FORGOT PASSWORD',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.height*0.035,
                    fontWeight: FontWeight.w500),
              ),
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
                  ])
          ),
        ),
      ),

      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: Container(

          child: Column(
            children: [
              Container(
                height: Get.height-81,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: Get.width,
                        height: Get.height * 0.35,
                        decoration: const BoxDecoration(
                          gradient:
                          LinearGradient(colors: [Colors.blue, Colors.indigo]),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Column(
                            children: [

                              Image.asset(
                                'assets/Image/forgot_password.png',
                                height: 80,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Get.height * .1,
                      left: Get.width * .05,
                      width: Get.width * .9,
                      height: Get.height * .55,
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
                                      child: Text("Don't worry It Happens.Please enter the\nPhone number associated with your account.",style: TextStyle(color: Colors.grey, fontSize: Get.height*0.023,fontWeight: FontWeight.w500),),
                                    ),
                                    SizedBox(height:Get.height*0.05),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(color: Colors.black54),
                                      maxLength: 10,
                                      controller: controller.phone,
                                      decoration: InputDecoration(
                                          contentPadding: EdgeInsets.zero,
                                          filled: true,
                                          hintStyle: const TextStyle(color: Colors.black54),
                                          hintText: 'Enter Phone number',
                                          counterText: '',
                                          prefixIcon: const Icon(Icons.phone),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10))),
                                      validator: MultiValidator(
                                        [
                                          RequiredValidator(
                                              errorText: 'Required Phone Number'),
                                          PatternValidator(RegExp(r'^[0-9]{10}$').pattern,
                                              errorText: 'Please enter valid Phone Number')
                                        ],

                                      ),
                                    ),

                                    SizedBox(height:Get.height*0.05),
                                    SizedBox(
                                      width: Get.width*0.6,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.indigo
                                        ),
                                          onPressed: () {
                                          // controller.signupformvalid();
                                          controller.ForgotPassword(context);},
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
