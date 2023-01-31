import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../controller/enter_pass_controller.dart';



class EnterPassView extends GetView<EnterPassController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title:  Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text(
                'CHANGE YOUR PASSWORD',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Get.height*0.025,
                    fontWeight: FontWeight.w500),
              ),
            ),

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

      resizeToAvoidBottomInset: false,
      body: Container(
        //height: Get.height,
        child: Column(
          children: [
            SizedBox(
              height: Get.height-100,
              // height: Get.height*0.9,
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/Image/change password.png',
                              height: Get.height*0.135,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // bottom: 0,
                    // width: Get.width * 1,
                    // height: Get.height * .6,
                    bottom: Get.height * .1,
                    left: Get.width * .05,
                    width: Get.width * .9,
                    height: Get.height * .52,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Form(
                          key: controller.EnterYourPassFormKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height * 0.012,
                              ),
                              Obx(()=>
                                  TextFormField(
                                    obscureText:
                                    controller.isPasswordHidden.value,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock,
                                          color: Colors.blue),
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: "New Password",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      suffixIcon: InkWell(
                                          child: Icon(
                                            controller.isPasswordHidden
                                                .value
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                          ),
                                          onTap: () {
                                            controller.isPasswordHidden
                                                .value =
                                            !controller
                                                .isPasswordHidden
                                                .value;
                                          }),
                                    ),
                                    onChanged: (value) {
                                      controller.newpassword = value;
                                    },
                                    validator: controller.passwordValidator,
                                  ),
                              ),
                              SizedBox(
                                height: Get.height * 0.012,
                              ),
                              Obx(()=>
                                  TextFormField(
                                    style: TextStyle(),
                                    obscureText:
                                    controller.isPasswordHidden.value,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock,
                                          color: Colors.blue),
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      hintText: "Confirm Password",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(30),
                                        borderSide: BorderSide(
                                          width: 2,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                    controller:
                                    controller.confirmPasswordController,
                                    onChanged: (value) {
                                      controller.password = value;
                                    },
                                    validator: (val) => MatchValidator(
                                        errorText:
                                        'passwords do not match').validateMatch(val.toString(), controller.newpassword),
                                  ),
                              ),
                              SizedBox(height:Get.height*0.05),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.4,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(side: BorderSide(color: Colors.indigoAccent),
                                          backgroundColor: Colors.white,
                                          shape: BeveledRectangleBorder()),
                                      child: Text("CANCEL",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: Get.height * 0.025)),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),),
                                  SizedBox(
                                    width: Get.width * 0.4,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.indigo,
                                          shape: BeveledRectangleBorder()),
                                      child: Text("SUBMIT",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: Get.height * 0.025)),
                                      onPressed: () {
                                        controller.enterPass(context,controller.password);

                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}