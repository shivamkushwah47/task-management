import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visiter_app/feature/profile/controller/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
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
                              height: Get.height * 0.17,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(11, 0, 15, 0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                  const Text(
                                    'PROFILE',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/Image/profile.png',
                              height: 90,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(

                        bottom: Get.height * .05,
                        width: Get.width * 1,
                        height: Get.height * .6,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                          ),


                     //  widget ListProfile(String text1, String text2){
                      // return Container(
                // const SizedBox(width: 24,),
                // ListProfile(String text1, String text2){
                      //   Container(



                         child: Padding(
                           padding: EdgeInsets.fromLTRB(40, 50, 10, 10),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children:  [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Text(
                                     "Name",
                                     style: TextStyle(
                                       color: Colors.black87,
                                       fontFamily: "Montserrat",
                                       fontSize: 30,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                               SizedBox(
                                 // height: Get.height * 0.17,
                                     child: (
                                       CircleAvatar(
                                         backgroundColor: Colors.green ,   radius:20 ,
                                         child: IconButton(
                                             onPressed: () {},
                                             icon: const Icon(
                                               Icons.camera_alt_outlined,size: 23,
                                               color: Colors.black,
                                             )),
                                       )
                                     ),
                               ),
                                 ],
                               ),

                               Text(
                                   "Admin Name Surname",
                                   style: TextStyle(
                                     color: Colors.black87,
                                     fontFamily: "Montserrat",
                                     fontSize: 18,
                                   ),
                               ),





                               SizedBox(
                                 height: Get.height*0.03,
                               ),
                               Text(
                                 "Designation",
                                 style: TextStyle(
                                   color: Colors.black87,
                                   fontFamily: "Montserrat",
                                   fontSize: 30,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                               Text(
                                 "Admin Designation",
                                 style: TextStyle(
                                   color: Colors.black87,
                                   fontFamily: "Montserrat",
                                   fontSize: 18,
                                 ),
                               ),
                               SizedBox(
                                 height: Get.height*0.03,
                               ),
                               Text(
                                 "Phone number",
                                 style: TextStyle(
                                   color: Colors.black87,
                                   fontFamily: "Montserrat",
                                   fontSize: 30,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                               Text(
                                 "+91 1234567890",
                                 style: TextStyle(
                                   color: Colors.black87,
                                   fontFamily: "Montserrat",
                                   fontSize: 18,
                                 ),
                               ),
                               ]
                           ),
                         ),),),








    SizedBox(
    height: Get.height * 0.17,
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
     // marginAll(22),
    Padding(
    padding: EdgeInsetsDirectional.fromSTEB(11, 0, 15, 0),
    child: CircleAvatar(
    backgroundColor: Colors.white ,
    child: IconButton(
    onPressed: () {},
    icon: const Icon(
    Icons.arrow_back_ios_new_rounded,
    color: Colors.black,
    )),
    ),
    ),
       ] ),),





                          //    const SizedBox(width: 24,),
                     //   ListProfile("Name", "Admin Name Surname"),
                     // ListProfile("Designation", "Admin Designation"),
                     // ListProfile("Phone Number", "+91 1234567890"),
                        //  const SizedBox(height: 16,),
                        //    Container(
                        //      width: double.infinity,
                        //      margin: EdgeInsets.only(top: 20),
                        //  )
                        //  child: Row(
                        //  crossAxisAlignment: CrossAxisAlignment.center,
                        //    children: [])
                             // SizedBox(height: 60,),




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


