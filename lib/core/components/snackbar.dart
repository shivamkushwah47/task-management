import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiter_app/core/global/colors.dart';

class Snackbar{
  final String title;
  final String msg;

  const Snackbar({required this.title,required this.msg});

  snack1(){
    Get.snackbar(title, msg,
        backgroundColor:Colors.white,
        colorText: GlobalColor.customMaterialColor
    );
  }

  snack2(){
    Get.snackbar(title, msg,
        backgroundColor:GlobalColor.themecolor,
        colorText: Colors.white
    );
  }

}