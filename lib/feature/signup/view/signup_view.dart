
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:visiter_app/Core/routes.dart';
import 'package:visiter_app/feature/signup/controller/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(


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
                                    'SIGN UP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Image.asset('assets/Image/sign up.png',

                              height: 90,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Get.height * .06,
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
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Form(
                                    key: controller.signupformkey,
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height: Get.height*0.04,),
                                          IntlPhoneField(

                                            decoration: const InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(width: 2,color:Colors.indigoAccent),
                                              ),

                                              counterText: '',
                                              hintText: 'Phone Number',
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(width: 2,color:Colors.indigoAccent),


                                              ),
                                            ),
                                            controller: SignupController.phoneController,
                                            initialCountryCode: 'IN',
                                            onChanged: (phone) {
                                              print(phone.completeNumber);
                                              SignupController.phonevalue=phone.toString();
                                            },
                                            validator: (value) =>
                                                controller.isSignupValid(value, 'Enter phone'),
                                          ),
                                          SizedBox(height: Get.height*0.07,),
                                          SizedBox(
                                            width: Get.width-160,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  controller.SignupValidate(context);
                                                },
                                                child: Text(
                                                  'REQUEST OTP',
                                                  style:
                                                  TextStyle(color: Colors.white),
                                                )),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Get.height*0.03,),
                                  Row(children: <Widget>[
                                    Expanded(
                                      child: new Container(
                                          margin: const EdgeInsets.only(
                                              left: 10.0, right: 15.0),
                                          child: Divider(
                                            color: Colors.black,
                                            height: 50,
                                          )),
                                    ),
                                    Text("or "),
                                    Expanded(
                                      child: new Container(
                                          margin: const EdgeInsets.only(
                                              left: 15.0, right: 10.0),
                                          child: Divider(
                                            color: Colors.black,
                                            height: 50,
                                          )),
                                    ),
                                  ]),
                                  SizedBox(height: Get.height*0.03,),

                                  SizedBox(

                                    width: Get.width - 140,

                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          side: BorderSide(
                                              width: 1.4,
                                              color: Colors.indigoAccent), // NEW
                                        ),
                                        onPressed: () {
                                          controller.checkconn();
                                          controller.googleLogin();
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/Image/google_bg.png",
                                              width: 25,
                                              height: 25,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'Signup with Google',
                                              style: TextStyle(
                                                // fontSize: Get.height*0.02,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.indigoAccent,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Already have an account? '),
                                      TextButton(
                                          onPressed: () {
                                            Get.toNamed(Routes.login);
                                          },
                                          child: Text(
                                            'Login',
                                            style:
                                            TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ),
                                  SizedBox(height: Get.height*0.3)
                                ],
                              ),
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
