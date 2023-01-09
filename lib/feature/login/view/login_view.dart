import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/feature/login/controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Image/login_bg-image.jpg'), fit: BoxFit.cover),
      ),



    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(),
          Container(
            padding: EdgeInsets.only(left: 35, top: 130),
            child: Text(
              'Welcome\nBack',
              style: TextStyle(color: Colors.white, fontSize: 33),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Form(
                      key: controller.loginFormKey,
                      child: Column(
                        children: [
                          TextFormField(
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email,color: Colors.purple),
                                fillColor: Colors.grey.shade300,
                                filled: true,
                                hintText: "Enter Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide( width: 2,
                                    color: Colors.purple,
                                  ),

                                )

                            ),
                            controller: controller.emailController,
                            onSaved: (value) {
                              controller.email = value!;
                            },
                            validator: (value) {
                              controller.isValid(value, 'Please Enter user Id');
                            },
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock,color: Colors.purple),
                                fillColor: Colors.grey.shade300,
                                filled: true,
                                hintText: "Password",
                               border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(  width: 2,
                                    color: Colors.purple,
                                  ),
                                )),
                            controller: controller.passwordController,
                            onSaved: (value) {
                              controller.password = value!;
                            },
                            validator: (value) {
                              controller.isValid(value, 'Enter password');},
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(color: Colors.purple,
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.purple.shade900,
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      controller.signupformvalid();
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                 Get.toNamed(Routes.signup);
                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.forgetpass);
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}


//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Center(
//             child: Container(
//                 child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 key: controller.loginFormKey,
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.bottomLeft,
//                       child: Text(
//                         "LOGIN",
//                         style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Image.asset(
//                       "assets/Image/visitor-management.jpg",
//                       width: 400,
//                       height: 150,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(
//                         hintText: "Enter email Id/ phone number",
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               width: 1, color: Colors.blue), //<-- SEE HERE
//                         ),
//                       ),
//                       controller: controller.emailController,
//                       onSaved: (value) {
//                         controller.email = value!;
//                       },
//                       validator: (value) {
//                         controller.isValid(value, 'Please Enter value');
//                       },
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Obx(
//                       () => TextFormField(
//                         obscureText: controller.ispasshidden.value,
//                         decoration: InputDecoration(
//                             hintText: "Password",
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(
//                                   width: 1, color: Colors.blue), //<-- SEE HERE
//                             ),
//                             suffix: InkWell(
//                               child: Icon(
//                                 controller.ispasshidden.value
//                                     ? Icons.visibility_off
//                                     : Icons.visibility,
//                                 color: Colors.grey,
//                                 size: 20,
//                               ),
//                               onTap: () {
//                                 controller.ispasshidden.value =
//                                     !controller.ispasshidden.value;
//                               },
//                             )),
//                         controller: controller.passwordController,
//                         onSaved: (value) {
//                           controller.password = value!;
//                         },
//                         validator: (value) {
//                           controller.isValid(value, 'Enter password');
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         // InkWell(
//                         //   child: Text(
//                         //     "Forgot password",
//                         //     style: TextStyle(
//                         //         fontSize: 18,
//                         //         fontWeight: FontWeight.bold,
//                         //         color: Colors.blue),
//                         //   ),
//                         //   onTap: () => controller.checkconnl(),
//                         //
//                         // ),
//                         TextButton(
//                           onPressed: () {
//                             controller.checkconnl();
//                             Get.toNamed(Routes.forgetpass);
//                           },
//                           child: Text(
//                             "Forgot password",
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.blue),
//                           ),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           minimumSize: const Size.fromHeight(50),
//                           shape: StadiumBorder(), // NEW
//                         ),
//                         onPressed: () {
//                           controller.signInEmailPass();
//                         },
//                         child: Text(
//                           'LOGIN',
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w800,
//                               color: Colors.white),
//                         )),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Create an account ?',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                         Text(
//                           'SIGNUP',
//                           style: TextStyle(
//                             color: Colors.blue,
//                             fontSize: 22,
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                       ],
//                     ),
//                     ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           minimumSize: const Size.fromHeight(50),
//                           shape: StadiumBorder(), // NEW
//                         ),
//                         onPressed: () {
//                           controller.EmailPassSignout();
//                         },
//                         child: Text(
//                           'Logout',
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w800,
//                               color: Colors.white),
//                         )),
//                   ],
//                 ),
//               ),
//             )),
//           ),
//         ),
//       ),
//     );
//   }
// }
