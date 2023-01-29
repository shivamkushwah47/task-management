import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EditTaskController extends GetxController {
  final GlobalKey<FormState> editFormKey = GlobalKey<FormState>();

  var selectedDate = DateTime.now().obs;
  final requiredValidator = RequiredValidator(errorText: 'this field is required');
  TextEditingController summarycontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();
  var taskTitle;
  var taskDesc;
  var tasksummary;
  chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        initialEntryMode: DatePickerEntryMode.input,
        initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select task end date',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'End date',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 5))))) {
      return true;
    }
    return false;
  }

  String? selecteduser;
  String? selectedPriority;
  List<String> Alluser = [];
  List<String> userlist = [];
  final List<String> priorityItems = [
    'Low',
    'High',
    'Medium',
  ];

validate(){
  if(editFormKey.currentState!.validate()){
    print("form validate");

  }
}

  // if(editFormKey.currentState!.validate()) {
  // }
  @override
  void onInit() async{
    //getUser();
    // var db=await Hive.openBox('mytask');
    // FireBase.userInfo.value=db.get('userInfo');
    // userlist.add(FireBase.userInfo['name']);
    // print("Hii ${FireBase.userInfo['name']}");
    // super.onInit();
  }

}