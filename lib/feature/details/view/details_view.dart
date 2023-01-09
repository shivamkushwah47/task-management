import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:visiter_app/Core/routes.dart';
import 'package:visiter_app/feature/details/controller/detail.controller.dart';

class DetailView extends GetView<DetailController> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350,
            height: Get.height,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Enter Details",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                Form(
                  key: controller.SignupFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Name",
                            border: OutlineInputBorder(),
                          ),
                          controller: controller.NameController2,
                          validator: (value) =>
                              controller.isvalid(value, 'Name'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        IntlPhoneField(
                          decoration: const InputDecoration(
                            counterText: '',
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          controller: controller.Number2,
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                          validator: (p0) {},
                        ),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Email Id",
                            border: OutlineInputBorder(),
                          ),
                          readOnly: true,
                          initialValue: controller.argumenData,
                          validator: (value) =>
                              controller.isvalid(value, 'Email Id'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Your Password",
                            border: OutlineInputBorder(),
                          ),
                          controller: controller.password2,
                          validator: (value) =>
                              controller.isvalid(value, 'password'),
                        ),
                      ),

                      SizedBox(height: 80,),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                shape: StadiumBorder()),
                            onPressed: () {
                              controller.validate();
                            },
                            child: Text(

                              "SUBMIT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 54,
                        width: 284,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                elevation: 3,
                                shape: StadiumBorder(),
                                padding: EdgeInsets.all(
                                    8) //content padding inside button
                                ),
                            onPressed: () {
                              controller.logout();
                              Get.toNamed(Routes.navigationbar);
                            },
                            child: Text("LogOut",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700))),
                      ),

                      //
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
