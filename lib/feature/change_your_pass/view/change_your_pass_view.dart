
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../controller/change_pwd_controller.dart';


class ChangePass extends GetView<ChangeYourPassController> {
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
                                    padding: EdgeInsetsDirectional.fromSTEB(11, 0, 15, 0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  const Text(
                                    'CHANGE YOUR PASSWORD',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/Image/change password.png',
                              height: 90,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(

                      bottom: Get.height * .05,
                      width: Get.width * 1,
                      height: Get.height * .6,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),


                        child: Padding(
                          padding: EdgeInsets.fromLTRB(40, 50, 10, 10),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(() => (TextFormField(
                                      style: TextStyle(),
                                      obscureText:
                                      controller.isPasswordHidden.value,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock,
                                            color: Colors.blue),
                                        fillColor: Colors.grey.shade100,
                                        filled: true,
                                        hintText: " Old Password",
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
                                      onChanged: (value) {
                                        controller.oldpassword = value;
                                      },
                                      validator: controller.passwordValidator,
                                    ))),
                                    SizedBox(
                                      height: Get.height * 0.02,
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
                                        hintText: "New Password",
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
                                      onChanged: (value) {
                                        controller.newpassword = value;
                                      },
                                      validator: controller.passwordValidator,
                                    ))),
                                    SizedBox(
                                      height: Get.height * 0.02,
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
                                        hintText: "Confirm Password",
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(30),
                                          borderSide: BorderSide(
                                            width: 2,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      controller:
                                      controller.confirmPasswordController,
                                      onSaved: (value) {
                                        controller.confirmPassword = value!;
                                      },
                                      validator: (val) => MatchValidator(
                                          errorText:
                                          'passwords do not match').validateMatch(val.toString(), controller.confirmPassword),
                                    ))),
                                    SizedBox(
                                      height: Get.height * 0.08,
                                    ),
                                    SizedBox(
                                      width: Get.width - 160,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            controller.createNewPass(context);
                                          },
                                          child: Text(
                                            'SIGNUP',
                                            style:
                                            TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  ],
                                ),








                  ],
                ),
              ),),


          ),
          ]
          ),
        ),
  ],
    ),
    )

    ),

    );
  }
}