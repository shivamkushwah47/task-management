import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:visiter_app/core/routes.dart';

import '../controller/forgot_otp_controller.dart';

class ForgotOtpView extends GetView<ForgotOtpController> {
  const ForgotOtpView({super.key});
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
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                    EdgeInsetsDirectional.fromSTEB(
                                        11, 0, 15, 0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Icon(
                                            Icons
                                                .arrow_back_ios_new_rounded,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  const Text(
                                    'OTP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/Image/otp.png',
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
                      height: Get.height * .6,
                      child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              children: [
                                Form(
                                    child: Column(
                                      children: [
                                        Text(
                                          "OTP Verification",
                                          style: TextStyle(
                                              fontSize: Get.height * 0.03,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 30, 0, 30),
                                          child: Text(
                                              "Enter the OTP sent to your mobile number",
                                              style: TextStyle(
                                                  fontSize:
                                                  Get.height * 0.015,
                                                  color: Colors.grey)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: SizedBox(
                                            child: Pinput(
                                              length: 6,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              onChanged: (value) {
                                                controller.code = value;
                                              },
                                              defaultPinTheme: PinTheme(
                                                height: 60.0,
                                                width: 60.0,
                                                textStyle:
                                                GoogleFonts.urbanist(
                                                  fontSize: 24.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white70,
                                                  border: Border.all(
                                                    color: Colors.indigo
                                                        .withOpacity(0.5),
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                              focusedPinTheme: PinTheme(
                                                height: 60.0,
                                                width: 60.0,
                                                textStyle:
                                                GoogleFonts.urbanist(
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
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 25, 0, 0),
                                          child: Text("Didn't Receive OTP?",
                                              style: TextStyle(
                                                  fontSize:
                                                  Get.height * 0.015,
                                                  color: Colors.grey)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 0, 0, 5),
                                          child: TextButton(
                                              onPressed: () {
                                                Get.toNamed(Routes.forgotpass);
                                              },
                                              child: Text(
                                                "Resend OTP",
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize:
                                                    Get.height * 0.018),
                                              )),
                                        ),
                                        SizedBox(
                                            width: Get.width * 0.6,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  controller
                                                      .otpverify(context);
                                                },
                                                style:
                                                ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                    Colors.indigo),
                                                child: Text("VERIFY OTP")))
                                      ],
                                    ))
                              ],
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
