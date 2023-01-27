import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:visiter_app/core/firebase/firebase.dart';
import 'package:visiter_app/core/routes.dart';
import 'package:visiter_app/feature/admin_teammember_page/addnew_memner_page/controller/add_member_controller.dart';

class AddMemberView extends GetView<AddMemberController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Scaffold(


  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(FireBase.userInfo['name']),
          accountEmail: Text("abc@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("assets/dp.png"),
          ),
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Notification"),
        ),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text("Delete Account"),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Log out"),
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
          'Add New Team',
          style: TextStyle(
              color: Colors.white,
              fontSize: Get.height*0.035,
              fontWeight: FontWeight.w500),
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
  body: GestureDetector(onTap:  () => Get.focusScope!.unfocus(),
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
                    height: Get.height * 0.40,
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
                          height: Get.height * 0.06,
                          child: Row(
                            children: [


                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/Image/addnewmember.png',
                          height: Get.height*0.115,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(

                    bottom: Get.height * .20,
                    width: Get.width * 1,
                    height: Get.height * .6,
                    child: Container(padding: EdgeInsetsDirectional.fromSTEB(25, 20, 25, 0) ,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),

                      child:
                      Form(
                        key: controller.AddTeamkey,
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                labelText: "Name",
                                hintText: "Team member name",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                fillColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,fontWeight: FontWeight.bold
                                ),
                              ),
                              controller: controller.nameController,
                              onChanged: (value) {
                                controller.name = value;
                              },
                              validator: (value) =>
                                  controller.isvalid(value, 'Name'),
                            ),
                            SizedBox(height: Get.height*0.005,),
                            TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,fontWeight: FontWeight.bold
                              ),
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "member@gmail.com",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                fillColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,fontWeight: FontWeight.bold
                                ),
                              ),
                                validator: controller.EmailValidator

                            ),
                            SizedBox(height: Get.height*0.015,),
                            TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                labelText: "Password",
                                hintText: "12345",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                fillColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,fontWeight: FontWeight.bold
                                ),
                              ),
                              validator: controller.passwordValidator,

                            ),
                            SizedBox(height: Get.height*0.015,),
                            TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                labelText: "Phone number",
                                hintText: "+918545896321",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                fillColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,fontWeight: FontWeight.bold
                                ),
                              ),

                              controller: controller.phoneController,
                              onChanged: (value) {
                                controller.phone = value;
                              },
                              validator: (value) =>
                                  controller.isvalid(value, 'number'),
                            ),


                            SizedBox(height: Get.height*0.045,),

                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(width: Get.width*0.40,
                                  child: ElevatedButton(

                                    style: ElevatedButton.styleFrom(side: BorderSide(color: Colors.indigoAccent),
                                        backgroundColor: Colors.white,
                                        shape:BeveledRectangleBorder()),
                                    child: Text("CANCEL",
                                        style: TextStyle(color: Colors.black, fontSize:Get.height*0.022)),
                                    onPressed: () {
                                    },
                                  ),
                                ),
                                Container(width: Get.width*0.40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.indigoAccent,
                                        shape:BeveledRectangleBorder()),
                                    child: Text("CREATE TEAM",
                                        style: TextStyle(color: Colors.white, fontSize:Get.height*0.022)),
                                    onPressed: () {
                                      controller.addmember(context);
                                    },

                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),



                    )
                )



              ],
            ),
          ),
        ],
      ),
    ),
  ),


);  }
}