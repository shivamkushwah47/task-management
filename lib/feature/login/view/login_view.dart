import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/feature/login/controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                Image.asset('assets/Image/login screen.png',

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
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Form(
                                    child: Column(

                                  key: controller.loginFormKey,
                                  children: [


                                    SizedBox(
                                      height: Get.height*0.07,
                                      child: TextFormField(
                                        style: TextStyle(
                                            color: Colors.black,
                                            ),
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.email,
                                                color: Colors.blue),
                                            fillColor: Colors.grey.shade300,
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
                                        validator: (value) {
                                          controller.isValid(
                                              value, 'Please Enter user Id');
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      height: Get.height*0.07,
                                      child:  Obx(()=>(
                                        TextFormField(style: TextStyle(),
                                          obscureText: controller.isPasswordHidden.value,
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.lock,
                                                  color: Colors.blue),
                                              fillColor: Colors.grey.shade300,
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
                                          validator: (value) {
                                            controller.isValid(
                                                value, 'Enter password');
                                          },


                                        ))
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.forgetpass);
                                        },
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(110, 0, 0, 0),
                                          child: Text(
                                            'Forgot Password',
                                            style: TextStyle(
                                              color: Color(0xff4c505b),
                                              fontSize: 16,
                                            ),
                                          ),
                                        )),

                                    SizedBox(
                                      width: Get.width-160,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            controller.loginformvalid();
                                          },
                                          child: Text(
                                            'LOGIN',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    )
                                  ],
                                )),
                                Row(children: <Widget>[
                                  Expanded(
                                    child: new Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0, right: 15.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 50,
                                        )),
                                  ),
                                  Text("or "),
                                  Expanded(
                                    child: new Container(
                                        margin: const EdgeInsets.only(
                                            left: 15.0, right: 10.0),
                                        child: Divider(
                                          color: Colors.black,
                                          height: 50,
                                        )),
                                  ),
                                ]),

                                SizedBox(
                                  height: Get.height*0.05,

                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        minimumSize: const Size.fromHeight(50),
                                        shape: StadiumBorder(),
                                        side: BorderSide(
                                            width: 1.4,
                                            color: Colors.purple), // NEW
                                      ),
                                      onPressed: () {
                                        controller.checkconn();
                                        controller.googleLogin();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                            'Log in with Google',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.purple,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Do not have a account? '),
                                      TextButton(
                                          onPressed: () {
                                            Get.toNamed(Routes.signup);
                                          },
                                          child: Text(
                                            'Signup',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ),
                                )
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

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:visiter_app/core/routes.dart';
// import 'package:visiter_app/feature/login/controller/login_controller.dart';
//
// class LoginView extends GetView<LoginController> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/Image/login_bg-image.jpg'), fit: BoxFit.cover),
//       ),
//
//
//
//     child: Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           Container(),
//           Container(
//             padding: EdgeInsets.only(left: 35, top: 130),
//             child: Text(
//               'Welcome\nBack',
//               style: TextStyle(color: Colors.white, fontSize: 33),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height * 0.5),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(left: 35, right: 35),
//                     child: Form(
//                       key: controller.loginFormKey,
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
//                             decoration: InputDecoration(
//                                 prefixIcon: Icon(Icons.email,color: Colors.purple),
//                                 fillColor: Colors.grey.shade300,
//                                 filled: true,
//                                 hintText: "Enter Email",
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide: BorderSide( width: 2,
//                                     color: Colors.purple,
//                                   ),
//
//                                 )
//
//                             ),
//                             controller: controller.emailController,
//                             onSaved: (value) {
//                               controller.email = value!;
//                             },
//                             validator: (value) {
//                               controller.isValid(value, 'Please Enter user Id');
//                             },
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           TextFormField(
//                             style: TextStyle(),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                                 prefixIcon: Icon(Icons.lock,color: Colors.purple),
//                                 fillColor: Colors.grey.shade300,
//                                 filled: true,
//                                 hintText: "Password",
//                                border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide: BorderSide(  width: 2,
//                                     color: Colors.purple,
//                                   ),
//                                 )),
//                             controller: controller.passwordController,
//                             onSaved: (value) {
//                               controller.password = value!;
//                             },
//                             validator: (value) {
//                               controller.isValid(value, 'Enter password');},
//                           ),
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Sign in',
//                                 style: TextStyle(color: Colors.purple,
//                                     fontSize: 27, fontWeight: FontWeight.w700),
//                               ),
//                               CircleAvatar(
//                                 radius: 30,
//                                 backgroundColor: Colors.purple.shade900,
//                                 child: IconButton(
//                                     color: Colors.white,
//                                     onPressed: () {
//                                       controller.signupformvalid();
//                                     },
//                                     icon: Icon(
//                                       Icons.arrow_forward,
//                                     )),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextButton(
//                                 onPressed: () {
//                                  Get.toNamed(Routes.signup);
//                                 },
//                                 child: Text(
//                                   'Sign Up',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       color: Color(0xff4c505b),
//                                       fontSize: 18),
//                                 ),
//                                 style: ButtonStyle(),
//                               ),
//                               TextButton(
//                                   onPressed: () {
//                                     Get.toNamed(Routes.forgetpass);
//                                   },
//                                   child: Text(
//                                     'Forgot Password',
//                                     style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       color: Color(0xff4c505b),
//                                       fontSize: 18,
//                                     ),
//                                   )),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//     );
//   }
// }
//
