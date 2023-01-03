import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:visiter_app/feature/otp/controller/otp_controller.dart';
import 'package:visiter_app/feature/signup/controller/signup_controller.dart';

class OtpView extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          // alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "VERIFY",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "WE HAVE SENT A VERIFICATION CODE TO ENTERED PHONE NUMBER",
                  style: TextStyle(
                    fontSize: 19,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(SignupController.phoneController.value.text,
                        style: TextStyle(fontSize: 20)),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blueAccent,
                          size: 25,
                        ))
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Pinput(
                  length: 6,
                  showCursor: true,
                  onChanged: (value) {
                    controller.code = value;
                  },
                  onCompleted: (pin) => print(pin),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Resend OTP",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 120,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade600,
                          shape: StadiumBorder()),
                      onPressed: () {
                        controller.otpverify();
                      },
                      child: Text(
                        "Verify OTP",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
