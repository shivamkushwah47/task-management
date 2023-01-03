import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:visiter_app/feature/signup/controller/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("CREATE ACCOUNT",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 28)),
                      ],
                    ), 

                  SizedBox(
                    height: 20,
                  ),

                    Text("ENTER YOUR PHONE NUMBER TO SEND OTP",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 22)),

                       Text("",
                            textAlign: TextAlign.left,
                            style: TextStyle(

                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 20)

                       ),

                  SizedBox(
                    height: 100,
                  ),
                  Form(
                    key: controller.myformkey,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IntlPhoneField(
                            decoration: const InputDecoration(
                              counterText: '',
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                            ),
                            controller: SignupController.phoneController,
                            initialCountryCode: 'IN',
                            onChanged: (phone) {
                              print(phone.completeNumber);
                              SignupController.phonevalue=phone.toString();
                            },
                            validator: (p0) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size.fromHeight(50),
                        shape: StadiumBorder(), // NEW
                      ),
                      onPressed: () {
                        controller.verifybyphone();
                         // Get.toNamed(Routes.navigationbar);
                      },
                      child: Text(
                        'SEND OTP',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      )),
                  SizedBox(
                    height: 24,
                  ),
                  Align(
                    child: Text("OR",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50),
                        shape: StadiumBorder(),
                        side:
                            BorderSide(width: 1.0, color: Colors.blue), // NEW
                      ),
                      onPressed: () {
                        controller.checkconn();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/Image/google_bg.png",
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'SIGNUP',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.blue),
                          ),
                        ],
                      )),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
