import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:visiter_app/core/components/custombutton.dart';
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/feature/login/controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
                                          onPressed: () {Get.back();},
                                          icon: const Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                   Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Get.height*0.035,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/Image/login screen.png',
                              height: Get.height * 0.12,
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
                            child: Form(
                                key: controller.loginFormKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: Get.height * 0.02,
                                      ),
                                      TextFormField(
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.email,
                                                color: Colors.blue),
                                            fillColor: Colors.grey.shade100,
                                            filled: true,
                                            hintText: "Enter Email or phone",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.blue,
                                              ),
                                            )),
                                        controller: controller.phone,
                                        onSaved: (value) {
                                          controller.email = value!;
                                        },
                                        validator: (value) {
                                          if (!controller.isEmail(value!) &&
                                              !controller.isPhone(value)) {
                                            return 'Please enter a valid email or phone number.';
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: Get.height*0.025,
                                      ),
                                      Obx(() => (TextFormField(
                                          style: TextStyle(),
                                          obscureText:
                                              controller.isPasswordHidden.value,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.lock,
                                                color: Colors.blue),
                                            fillColor: Colors.grey.shade100,
                                            filled: true,
                                            hintText: "Password",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            suffixIcon: InkWell(
                                                child: Icon(
                                                  controller.isPasswordHidden
                                                          .value
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                ),
                                                onTap: () {
                                                  controller.isPasswordHidden
                                                          .value =
                                                      !controller
                                                          .isPasswordHidden
                                                          .value;
                                                }),
                                          ),
                                          controller: controller.pass,
                                          onSaved: (value) {
                                            controller.password = value!;
                                          },
                                          validator: (value) {
                                            if (!controller
                                                .validateStructure(value!)) {
                                              return 'Please enter a valid Password';
                                            }
                                            return null;
                                          }))),
                                      SizedBox(
                                        height: Get.height * 0.015,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            child: Text(
                                              "Forgot password?",
                                              style: TextStyle(
                                                  fontSize: Get.height*0.018,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.indigoAccent
                                              ),
                                            ),
                                            onTap: () {
                                              controller
                                                  .forgotPassword(context);
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.045,
                                      ),
                                      SizedBox(
                                        width: Get.width - 150,
                                         child:
                                         CustomButton(
                                           title: "Login",
                                           onPress: () {

                                             controller.login(
                                                           context,
                                                           controller.phone.text,
                                                           controller.pass.text);
                                           },
                                         ),
                                        // ElevatedButton(
                                        //     onPressed: () {
                                        //       controller.login(
                                        //           context,
                                        //           controller.phone.text,
                                        //           controller.pass.text);
                                        //     },
                                        //     style: ElevatedButton.styleFrom(
                                        //         backgroundColor: Colors.indigo),
                                        //     child: Text(
                                        //       'LOGIN',
                                        //
                                        //       style: TextStyle(
                                        //           fontSize:Get.height*0.030,
                                        //           color: Colors.white),
                                        //     )),
                                      ),
                                      SizedBox(
                                        height: Get.height*0.015,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Do not have an account?'),
                                            TextButton(
                                                onPressed: () {
                                                  Get.toNamed(Routes.signup);
                                                },
                                                child: Text(
                                                  'Signup',
                                                  style: TextStyle(
                                                      color: Colors.indigoAccent),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
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
