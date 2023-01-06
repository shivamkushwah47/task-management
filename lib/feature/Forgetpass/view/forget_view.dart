import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../controller/forget_controller.dart';

class ForgetView extends GetView<ForgetController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: controller.forgetFormKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 250,
                      child: Image.asset(
                        "assets/Image/forgotpass.png",
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Forgot",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Password?",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("Don't worry! it happens. Please enter the",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("address associated with your account.",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey),
                      ),
                    ),
SizedBox(height: 10,),

                    TextFormField(
                      decoration: InputDecoration(
                        hintText: " Enter email Id",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Colors.purple), //<-- SEE HERE
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
                    SizedBox(
                      height: 20,
                    ),


                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: Get.width-160,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            minimumSize: const Size.fromHeight(45),
                            shape: StadiumBorder(), // NEW
                          ),
                          onPressed: () {
                            controller.forget();
                          },
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            )),
          ),
        ),
      ),
    );
  }
}
