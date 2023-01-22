import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../Forgot_pass/view/Forgot_view.dart';
import '../../register/View/register_view.dart';
import '../controller/bottombar_controller.dart';


class  BottombarView extends StatelessWidget{

  BottombarController bottombarController = Get.find();
  BottombarView({Key? key}):super(key:key);
  final screens = [RegisterView(),
    ForgotView(),
    RegisterView(),
    ForgotView(),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

      body:
      Obx(()=>IndexedStack(
        index: bottombarController.currentIndex.value,
        children: screens,
      ),
      ),


      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
          color: Colors.grey,
          activeColor: Colors.indigo,
          items: const[
            TabItem(icon: Icons.home,),
            TabItem(icon: Icons.calendar_month,),
            TabItem(icon: Icons.add,),
            TabItem(icon: Icons.people,),
            TabItem(icon: Icons.settings,)
          ]),






    );

  }
}

