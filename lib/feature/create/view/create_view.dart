import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/create_controller.dart';

class CreateView extends GetView<CreateController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer:Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Shubham Sharma"),
              accountEmail: Text("Shubhampandrinath@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/dp.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Account"),
              subtitle: Text("Personal"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("Shubhampandrinath@gmail.com"),
              trailing: Icon(Icons.send),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title:  Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              'Create New Task',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.height*0.035,
                  fontWeight: FontWeight.w500),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search_sharp,
                  color: Colors.white,
                )),
          ],
        ),
        elevation: 0,
        flexibleSpace: Container(

          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.blue,
                    Colors.indigo
                  ])
          ),
        ),
      ),

      resizeToAvoidBottomInset : false,

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
                          gradient:
                          LinearGradient(colors: [Colors.blue, Colors.indigo]),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: Get.height * 0.15,
                              //   child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //     children: [
                              //       IconButton(
                              //           onPressed: () {},
                              //           icon: const Icon(
                              //             Icons.line_weight_sharp,
                              //             color: Colors.white,
                              //           )),
                              //       const Text(
                              //         'Create New Task',
                              //         style: TextStyle(
                              //             color: Colors.white,
                              //             fontSize: 25,
                              //             fontWeight: FontWeight.w600),
                              //       ),
                              //       IconButton(
                              //           onPressed: () {},
                              //           icon: const Icon(
                              //             Icons.search_sharp,
                              //             color: Colors.white,
                              //           )),
                              //     ],
                              //   ),
                              // ),
                              SizedBox(height: Get.height*0.02,),
                              TextFormField(
                                style:  TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  // prefixIcon: Icon(Icons.email,color: Colors.black,),
                                  fillColor: Colors.transparent,
                                  labelText: 'Title',
                                  labelStyle: TextStyle(color: Colors.white, fontSize: Get.height*0.03, fontWeight: FontWeight.w500),
                                  // filled: true,
                                  focusedBorder:  UnderlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                    borderSide: BorderSide( width: 2,color: Colors.white

                                    ),),
                                  enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide( width: 2,color: Colors.white
                                      )
                                  ),

                                ),
                                controller: controller.titleController,
                                onSaved: (value) {
                                  // controller.title = value!;
                                },
                                validator: (value) {
                                  controller.isValid(value, 'Please Enter Title');
                                },
                              ),
                              TextFormField(
                                style:  TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  // prefixIcon: Icon(Icons.email,color: Colors.black,),
                                  fillColor: Colors.transparent,
                                  // hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                  labelText: 'Description',
                                  labelStyle: TextStyle(color: Colors.white, fontSize: Get.height*0.03, fontWeight: FontWeight.w500),
                                  // filled: true,
                                  // hintText: "Enter Email",
                                  focusedBorder:  UnderlineInputBorder(
                                    borderRadius: BorderRadius.zero,
                                    borderSide: BorderSide( width: 2,color: Colors.white

                                    ),),
                                  enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide( width: 2,color: Colors.white
                                      )


                                  ),
                                ),
                                controller: controller.descriptionController,
                                onSaved: (value) {
                                  // controller.description = value!;
                                },
                                validator: (value) {
                                  controller.isValid(value, 'Please Enter Description');
                                },
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Get.height * .08,
                      // left: Get.width * .05,
                      width: Get.width,
                      height: Get.height * .6,
                      child: Card(
                          elevation: 10,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Form(
                                    key: controller.forgetFormKey,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Don't worry It Happens.Please enter the address associated with your account.",style: TextStyle(color: Colors.grey, fontSize: Get.height*0.025),),
                                        ),
                                        SizedBox(height:Get.height*0.05),
                                        TextFormField(
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.email,color: Colors.black,),
                                            fillColor: Colors.grey.shade200,
                                            hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                            filled: true,
                                            hintText: "Enter Email",
                                            focusedBorder:  OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide: BorderSide( width: 0,color: Colors.transparent

                                              ),),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(30),
                                                borderSide: BorderSide( width: 0,color: Colors.transparent
                                                )


                                            ),

                                          ),
                                          // controller: controller.emailController,
                                          onSaved: (value) {
                                            controller.email = value!;
                                          },
                                          validator: (value) {
                                            controller.isValid(value, 'Please Enter email');
                                          },
                                        ),
                                        SizedBox(height:Get.height*0.05),
                                        SizedBox(
                                          width: Get.width*0.6,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.indigo
                                              ),
                                              onPressed: () {controller.signupformvalid();},
                                              child: Text('SUBMIT',style: TextStyle(color: Colors.white),)

                                          ),
                                        )

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
