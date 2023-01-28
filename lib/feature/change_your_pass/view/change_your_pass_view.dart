import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:visiter_app/feature/change_your_pass/controller/change_pwd_controller.dart';




class ChangePassView extends GetView<ChangeYourPassController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        //height: Get.height,
        child: Column(
          children: [
            SizedBox(
              height: Get.height*0.9,
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
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                Text(
                                  'CHANGE PASSWORD',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Get.height*0.035,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          Image.asset(
                            'assets/Image/change password.png',
                            height: Get.height*0.115,
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    width: Get.width * 1,
                    height: Get.height * .6,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Form(
                        key: controller.ChangeYourPassFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height:Get.height*0.012 ,
                            ),
                            Obx(()=>
                              TextFormField(
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
                                controller: controller.oldpasswordController,
                                onChanged: (value) {
                                  controller.oldpassword = value;
                                },
                                validator: controller.passwordValidator,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.012,
                            ),
                            Obx(()=>
                                TextFormField(
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
                                  // suffixIcon: InkWell(
                                  //     child: Icon(
                                  //       controller.isPasswordHidden
                                  //           .value
                                  //           ? Icons.visibility_off
                                  //           : Icons.visibility,
                                  //     ),
                                  //     onTap: () {
                                  //       controller.isPasswordHidden
                                  //           .value =
                                  //       !controller
                                  //           .isPasswordHidden
                                  //           .value;
                                  //     }),
                                ),
                                onChanged: (value) {
                                  controller.newpassword = value;
                                },
                                validator: controller.passwordValidator,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * 0.012,
                            ),
                            Obx(()=>
                                TextFormField(
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
                                onChanged: (value) {
                                  controller.password = value;
                                },
                                validator: (val) => MatchValidator(
                                    errorText:
                                    'passwords do not match').validateMatch(val.toString(), controller.newpassword),
                              ),
                            ),
                            SizedBox(
                              height: Get.height*.055,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.4,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(side: BorderSide(color: Colors.indigoAccent),
                                        backgroundColor: Colors.white,
                                        shape: BeveledRectangleBorder()),
                                    child: Text("CANCEL",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: Get.height * 0.025)),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.4,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.indigo,
                                        shape: BeveledRectangleBorder()),
                                    child: Text("SUBMIT",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Get.height * 0.025)),
                                    onPressed: () {
                                      controller.changePass(context,controller.password,controller.oldpassword.toString(),controller.id);
                                      controller.clearText();

                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}