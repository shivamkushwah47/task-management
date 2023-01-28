import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:visiter_app/core/global/colors.dart';
import 'package:visiter_app/feature/bottambar/controller/bottombar_controller.dart';


class  BottombarView extends GetView<BottombarController>{
  BottombarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: controller.AdminalPages[controller.selectedindex.value],
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
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

      ),
    )
    );

  }
}

