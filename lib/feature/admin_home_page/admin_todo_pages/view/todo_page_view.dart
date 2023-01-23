import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:visiter_app/feature/admin_home_page/admin_todo_pages/controller/todo_page_controller.dart';

class TodoView extends GetView<TodoController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Scaffold(

    resizeToAvoidBottomInset: false,
    body: Container(
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
    children: [
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 10, 0),
      child: IconButton(
      onPressed: () {},
      icon: const Icon(
      Icons.menu,size: 30,
      color: Colors.white,
      )),
    ),
    const Text(
    'TO Do',
    style: TextStyle(
    color: Colors.white,
    fontSize: 23,
    fontWeight: FontWeight.w600),
    ),

    ],
    ),
    ),
    Image.asset(
    'assets/Image/Todo.png',
    height: Get.height*0.115,
    )
    ],
    ),
    ),
    ),
    Positioned(

    bottom: Get.height * .05,
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
    Column(
      children: [
        Padding(
          padding:EdgeInsetsDirectional.fromSTEB(5, 0,5, 8) ,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Created Task",style: TextStyle(fontSize: Get.height*0.025,fontWeight: FontWeight.bold)),
              Text("Priority",style: TextStyle(fontSize: Get.height*0.015,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Container(
          width: Get.width * 0.95,


          margin: EdgeInsets.only(top: 10),

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: Get.height * 0.09,
                  //padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [

                    SizedBox(
                      width: Get.width * 0.06,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Login page',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Get.height * 0.017,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Get.height * 0.012,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "30/01/2023",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: Get.height * 0.012,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                      ],
                    ),
                    Expanded(child: Container()),
                    IconButton(onPressed:(){} , icon: Icon(Icons.more_vert_outlined),iconSize: 30,color: Colors.black,),
                    SizedBox(width:Get.width*0.02,)
                  ]),
                ),
              ),
            ],
          ),
        ),
      ],
    ),



    )
    )



    ],
    ),
    ),
    ],
    ),
    ),




    );  }
}