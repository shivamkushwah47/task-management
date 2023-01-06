import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OTP",
                      style: TextStyle(color: Colors.purple,fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),


                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/Image/otp_view.jpeg",
                  width: 250,
                ),


                SizedBox(
                  height: 10,
                ),
                Text(
                  "VERIFICATION CODE ",
                  style: TextStyle(color: Colors.purple,fontSize: 19, fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(
                  height: 10,
                ),
                Text(
                  "We have sent the verification code to your Mobile Number ",
                  style: TextStyle(color: Colors.grey,fontSize: 16, fontWeight: FontWeight.w400
                  ),
                  textAlign: TextAlign.center,
                ),




                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      // decoration: BoxDecoration(
                      //     border: Border.all(),
                      //     borderRadius: const BorderRadius.horizontal(
                      //         left: Radius.circular(20), right: Radius.circular(20))
                      // ),
                   child:Text(SignupController.phoneController.value.text,

                        style: TextStyle(fontSize: 20,)),),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.green,
                          size: 25,
                        ))
                  ],
                ),
                // SizedBox(
                //   height: 25,
                // ),
                // Pinput(
                //   length: 6,
                //   showCursor: true,
                //   onChanged: (value) {
                //     controller.code = value;
                //   },
                //   onCompleted: (pin) => print(pin),
                // ),


                SizedBox(
                  height: 25,
                ),

                /// pinput package we will use here
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    child: Pinput(
                      length: 6,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,


                      defaultPinTheme: PinTheme(
                        height: 60.0,
                        width: 60.0,
                        textStyle: GoogleFonts.urbanist(
                          fontSize: 24.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white70,
                          border: Border.all(
                            color: Colors.purple.withOpacity(0.5),
                            width: 2.0,

                          ),
                        ),
                      ),


                      focusedPinTheme: PinTheme(
                        height: 60.0,
                        width: 60.0,
                        textStyle: GoogleFonts.urbanist(
                          fontSize: 24.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),


                    ),
                  ),
                ),




                // SizedBox(
                //   height: 20,
                // ),
                // InkWell(
                //   onTap: () {},
                //   child: Text(
                //     "Resend OTP",
                //     style: TextStyle(
                //         fontSize: 18,
                //         color: Colors.black,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: StadiumBorder()),
                      onPressed: () {
                        controller.otpverify();
                      },
                      child: Text(

                        "SUBMIT",
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
