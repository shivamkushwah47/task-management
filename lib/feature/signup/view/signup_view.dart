import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:visiter_app/Core/routes.dart';
import 'package:visiter_app/feature/signup/controller/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold( backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Sign up",
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                      ],
                    ),

                  //
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 7,bottom: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number", style: TextStyle( color: Colors.black,fontSize: 18, fontWeight: FontWeight.bold),),
                      ],

                    ),
                  ),


                  // SizedBox(
                  //   height: 10,
                  // ),
                  //      Text("Phone Number",
                  //           textAlign: TextAlign.left,
                  //           style: TextStyle(
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 16),
                  //      ),

                  SizedBox(
                    height: 20,
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
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(width: 2,color:Colors.purple),


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
                    height: 65,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        minimumSize: const Size.fromHeight(50),
                        shape: StadiumBorder(), // NEW
                      ),
                      onPressed: () {
                        controller.verifybyphone();
                         // Get.toNamed(Routes.navigationbar);
                      },
                      child: Text(

                        'Request OTP',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),


                      )),
                  SizedBox(
                    height: 24,
                  ),


                  Row(children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),

                    Text("or Sign in with Google"),

                    Expanded(
                      child: new Container(
                          margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                          child: Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),
                  ]),


                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(50),
                        shape: StadiumBorder(),
                        side:
                            BorderSide(width: 1.4, color: Colors.purple), // NEW
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
                            'Google',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.purple,),

                          ),
                        ],
                      )),
                  SizedBox(
                    height: 60,
                  ),
                  Container(

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already registered'),
                        TextButton(onPressed: (){
                          Get.toNamed(Routes.login);

                        }, child:Text('Login',style: TextStyle(color: Colors.purple),))

                      ],


                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
