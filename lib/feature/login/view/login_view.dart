import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
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
                                  const Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
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
                            child: Form(
                                key: controller.loginFormKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: Get.height * 0.04,
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
                                              hintText: "Enter Email",
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors.blue,
                                                ),
                                              )),
                                          controller:
                                              controller.phone,
                                          onSaved: (value) {
                                            controller.email = value!;
                                          },
                                          validator: controller.EmailValidator),
                                      SizedBox(
                                        height: 30,
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
                                          controller:
                                              controller.pass,
                                          onSaved: (value) {
                                            controller.password = value!;
                                          },
                                          validator:
                                              controller.passwordValidator))),
                                      SizedBox(
                                        height: Get.height*0.03,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          InkWell(
                                            child: Text(
                                              "Forgot password",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.indigoAccent),
                                            ),

                                            onTap: () {
                                              controller
                                                  .forgotPassword(context);
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height*0.07,
                                      ),
                                      SizedBox(
                                        width: Get.width - 150,
                                        child: ElevatedButton(
                                            onPressed: () {
                                              controller.login(context,controller.phone.text, controller.pass.text);
                                            },
                                            child: Text(
                                              'LOGIN',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text('Do not have an account? '),
                                            TextButton(
                                                onPressed: () {
                                                  Get.toNamed(Routes.signup);
                                                },
                                                child: Text(
                                                  'Signup',
                                                  style: TextStyle(
                                                      color: Colors.blue),
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
