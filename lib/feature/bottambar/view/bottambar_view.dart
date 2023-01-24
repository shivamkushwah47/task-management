import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:visiter_app/feature/admin_home_page/view/home_page_view.dart';
import '../../../core/global/colors.dart';
import '../../Forgot_pass/view/Forgot_view.dart';
import '../../admin_AllTask_page/view/ALL_Task_view.dart';
import '../../register/View/register_view.dart';
import '../controller/bottombar_controller.dart';




class  BottombarView extends GetView<BottombarController>{
  BottombarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
      body: controller.adminallpages[controller.selectedindex.value],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.white,
        color:GlobalColor.themecolor,
          activeColor: Colors.indigo,
        onTap: (value) {
          controller.selectIndex(value);
        },
                items: const[
                  TabItem(icon: Icons.home,),
                  TabItem(icon: Icons.calendar_month,),
                  TabItem(icon: Icons.add,),
                  TabItem(icon: Icons.people,),
                  TabItem(icon: Icons.settings,)
                ]),

    )
    );

  }
}

