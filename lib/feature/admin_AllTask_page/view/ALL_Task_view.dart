import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:visiter_app/feature/admin_AllTask_page/controller/All_Task_controller.dart';

class AllTaskView extends GetView<AllTaskController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Scaffold(body: SafeArea(
  child:   Container(
  
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        IconButton(

            onPressed: () {},
            icon: const Icon(



              Icons.menu,size: 35,



            )),
        Text("January 2023"),

        IconButton(

            onPressed: () {},
            icon: const Icon(
              Icons.search,size: 35,
            )),

      ],

    ),
  
  ),
),
);  }
}