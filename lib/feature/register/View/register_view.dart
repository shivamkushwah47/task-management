


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:visiter_app/feature/register/Controller/register_cotroller.dart';

class RegisterView extends GetView<RegisterController> {
  @override

  Widget build(BuildContext context)
  {  Size size = MediaQuery.of(context).size;

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
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: Colors.white,
                                    )),
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
                          Image.asset('assets/Image/register.png',

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
                    height: Get.height * .63,
                    child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Form(
                              key: controller.SignUpFormKey,
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
                                    onSaved: (value) {
                                      controller.name = value!;
                                    },
                                    validator: (value) =>
                                        controller.isvalid(value, 'Name'),
                                  ),
                                  SizedBox(height: Get.height*0.02,),
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
                                    controller: controller.emailController,
                                    onSaved: (value) {
                                      controller.email = value!;
                                    },
                                    validator: (value) =>
                                        controller.isvalid(value, 'email'),
                                  ),
                                  SizedBox(height: Get.height*0.02,),
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
                                    controller: controller.phoneController,
                                    onSaved: (value) {
                                      controller.phone = value!;
                                    },
                                    validator: (value) =>
                                        controller.isvalid(value, 'phone'),
                                  ),
                                  SizedBox(height: Get.height*0.02,),
                                  Obx(()=>(
                                      TextFormField(style: TextStyle(),
                                        obscureText: controller.isPasswordHidden.value,
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
                                              child: Icon(controller.isPasswordHidden.value
                                                  ? Icons.visibility
                                                  :Icons.visibility_off,
                                              ),
                                              onTap: () {
                                                controller.isPasswordHidden.value=!controller.isPasswordHidden.value;


                                              }),

                                        ),
                                        controller: controller.passwordController,
                                        onSaved: (value) {
                                          controller.password = value!;
                                        },
                                        validator: (value) =>
                                            controller.isvalid(value, 'password'),

                                      ))
                                  ),
                                  SizedBox(height: Get.height*0.02,),
                                  Obx(()=>(
                                      TextFormField(style: TextStyle(),
                                        obscureText: controller.isPasswordHidden.value,
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
                                        controller: controller.confirmpassController,
                                        onSaved: (value) {
                                          controller.confirmPassword = value!;
                                        },
                                        validator: (value) =>
                                            controller.isvalid(value, 'password'),


                                      ))
                                  ),
                                  SizedBox(height: Get.height*0.02,),
                                  SizedBox(
                                    width: Get.width-160,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          controller.validate();
                                        },
                                        child: Text(
                                          'SUBMIT',
                                          style:
                                          TextStyle(color: Colors.white),
                                        )),
                                  )
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
