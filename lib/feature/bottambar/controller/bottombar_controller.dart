
import 'package:get/get.dart';



class BottombarController extends GetxController{
 var currentIndex=0.obs;

 void changeIndex( var _index){
  print(_index);
  currentIndex.value= _index;

 }


}