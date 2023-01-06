


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:visiter_app/feature/otpdetail/Controller/otp_detail_controller.dart';

class OtpDetail extends GetView<OtpDetailController> {
  @override

  Widget build(BuildContext context)
  {  Size size = MediaQuery.of(context).size;

  return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Image/registerbackground.jpeg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Register to \nGet Started!',
                style: TextStyle(color: Colors.white, fontSize: 23,fontWeight: FontWeight.bold),
              ),
            ),
            Center(

              child: SizedBox(
                width: double.infinity,
                height: size.height,

                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,

                  child: Column(

                    children: [
                      // SizedBox(
                      //   height: 10,
                      // ),
                      //
                      // Container(
                      //   margin: EdgeInsets.only(top:20, left:10),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.end,
                      //     children: [
                      //       IconButton(onPressed: (){
                      //         //Get.toNamed(Routes.otp);
                      //
                      //       }, icon: Icon(Icons.arrow_back_ios_new_sharp,size: 40,)),
                      //
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // Container(
                      //   alignment: Alignment.topLeft,
                      //   margin: EdgeInsets.only(left: 10),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: const [
                      //       Text("Hello! Signup", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.purple),),
                      //       Text("to get started", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.purple),),
                      //     ],
                      //
                      //   ),
                      // ),

                      SizedBox(
                        height: 150,
                      ),

                      Column(
                        children: [
                          Form(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            key: controller.SignUpFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: size.width*0.8,
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                   padding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.purple,width: 2,),
                                  ),
                                  child: TextFormField(
                                    controller: controller.name,
                                    // onSaved: (value) {
                                    //   controller.fname= value!;
                                    // },
                                    validator: (value) {
                                      if(value == null || value.isEmpty){
                                        return 'Please enter your Name';
                                      }
                                      return null;

                                      //return controller.validateName(value!);
                                    },
                                    cursorColor: Colors.teal,
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
                                    decoration: const InputDecoration(
                                      hintText: "Enter full name",
                                      prefixIcon: Icon(Icons.person),
                                      helperStyle: TextStyle(color: Colors.teal),
                                      border: InputBorder.none,

                                    ),
                                  ),
                                ),

                                Container(

                                  width: size.width*0.8,
                                  //height: size.height*0.08,

                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  padding: EdgeInsets.symmetric(vertical: 1,horizontal:10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.purple,width: 2,),
                                  ),
                                  child: TextFormField(
                                    controller: controller.phone,
                                    // onSaved: (value) {
                                    //   controller.pnumber= value!;
                                    // },
                                    validator: (value) {
                                      if(value == null || value.isEmpty){
                                        return 'Please enter your number';
                                      }
                                      //return null;

                                      // return controller.validateMobile(value!);
                                    },
                                    cursorColor: Colors.teal,
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.phone),
                                      hintText: "Enter mobile no.",
                                      helperStyle: TextStyle(color: Colors.teal),
                                      border: InputBorder.none,

                                    ),
                                  ),
                                ),

                                Container(
                                 width: size.width*0.8,
                                   margin: EdgeInsets.symmetric(vertical: 8),
                                   padding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.purple,width: 2,),
                                  ),
                                  child: TextFormField(
                                    controller: controller.email,
                                    // onSaved: (value) {
                                    //   controller.lemail= value!;
                                    // },
                                    validator: (value) {
                                      if(value == null || value.isEmpty){
                                        return 'Please enter your email';
                                      }
                                      return null;

                                      // return controller.validateEmail(value!);
                                    },
                                    cursorColor: Colors.teal,
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.email),

                                      hintText: "Enter email",
                                      helperStyle: TextStyle(color: Colors.teal),
                                      border: InputBorder.none,

                                    ),
                                  ),
                                ),


                                Container(
                                  width: size.width*0.8,
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  padding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.purple,width: 2,),
                                  ),
                                  child: TextFormField(
                                    controller: controller.password,
                                    // onSaved: (value) {
                                    //   controller.Epassword= value!;
                                    // },
                                    validator: (value) {
                                      if(value == null || value.isEmpty){
                                        return 'Please enter your password';
                                      }
                                      return null;

                                      //return controller.ValidatePassword(value!);
                                    },
                                    cursorColor: Colors.teal,
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.lock),

                                      hintText: "Enter password",
                                      helperStyle: TextStyle(color: Colors.teal),
                                      border: InputBorder.none,

                                    ),
                                  ),
                                ),

                                Container(
                                  width: size.width*0.8,
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  padding: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                                   decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(color: Colors.purple,width: 2,),
                                  ),
                                  child: TextFormField(
                                    controller: controller.confirmpass,
                                    // onSaved: (value) {
                                    //   controller.Epassword= value!;
                                    // },
                                    validator: (value) {
                                      if(value == null || value.isEmpty){
                                        return 'Please enter your password';
                                      }
                                      return null;

                                      // return controller.ValidateConfirmPassword(value!);
                                    },
                                    cursorColor: Colors.teal,
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.lock),

                                      hintText: "Confirm password",
                                      helperStyle: TextStyle(color: Colors.teal),
                                      border: InputBorder.none,

                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height:40,
                                ),
                                Container(
                                  width: size.width*0.6,
                                  child: ClipRRect(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(50),
                                        ),),
                                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 5, horizontal: 0,),),
                                        backgroundColor: MaterialStateProperty.all(Colors.purple),
                                      ),
                                      onPressed: (){

                                        controller.SignUpAPI();

                                      },
                                      child: Text("Submit", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,),),
                                    ),
                                    
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Already Have Account?"),
                                    TextButton(onPressed: (){}, child: Text("LOGIN",style:TextStyle(color: Colors.purple)),)
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                ),
              ),
            ),

          ],
        ),
      ),
    );

  }
}
