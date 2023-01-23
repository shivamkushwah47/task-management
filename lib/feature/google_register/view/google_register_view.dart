import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:visiter_app/feature/google_register/controller/google_register_controller.dart';

class GoogleRegisterView extends GetView<GoogleRegisterController> {
  @override
  Widget build(BuildContext context) {

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
                              height: Get.height * 0.15,
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
                                    'REGISTER',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/Image/register.png',
                              height: 90,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Get.height * .02,
                      left: Get.width * .05,
                      width: Get.width * .9,
                      height: Get.height * .7,
                      child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Form(
                                key: controller.GoogleFormKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person,
                                              color: Colors.blue),
                                          fillColor: Colors.grey.shade100,
                                          filled: true,
                                          hintText: "Enter Name",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.blue,
                                            ),
                                          )),
                                      controller: controller.nameController,
                                      onChanged: (value) {
                                        controller.name = value;
                                      },
                                      validator: (value) =>
                                          controller.isvalid(value, 'Name'),
                                    ),
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
                                            hintText: "Enter Email",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                width: 2,
                                                color: Colors.blue,
                                              ),
                                            )),
                                        readOnly: true,
                                        initialValue: controller.googleArgument,
                                        validator: controller.EmailValidator
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    TextFormField(
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.phone,
                                              color: Colors.blue),
                                          fillColor: Colors.grey.shade100,
                                          filled: true,

                                          hintText: "Enter Phone",
                                          border: OutlineInputBorder(
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.blue,
                                            ),
                                          )),
                                      onChanged: (value) {
                                        controller.phone = value;
                                      },
                                      validator: (value) =>
                                          controller.isvalid(value, 'phone'),
                                    ),
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
                                      onChanged: (value) {
                                        controller.password = value;
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
                                      controller.confirmpassController,
                                      onSaved: (value) {
                                        controller.confirmPassword = value!;
                                      },
                                      validator: (val) => MatchValidator(
                                          errorText:
                                          'passwords do not match').validateMatch(val.toString(), controller.password),
                                    ))),
                                    SizedBox(
                                      height: Get.height * 0.08,
                                    ),
                                    SizedBox(
                                      width: Get.width - 160,
                                      child: ElevatedButton(
                                          onPressed: () {
                                             controller.createUser(context);
                                          },
                                          child: Text(
                                            'SIGNUP',
                                            style:
                                            TextStyle(color: Colors.white),
                                          )),
                                    ),

                                    SizedBox(height: Get.height*0.4,),
                                  ],
                                ),

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
