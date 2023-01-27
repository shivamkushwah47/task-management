import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:visiter_app/core/components/loader.dart';
import 'package:visiter_app/core/firebase/firebase.dart';

class CreateTaskController extends GetxController {
  var selectedDate = DateTime.now().obs;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  date() {
    print("inside function");
  }

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

  final List<String> priorityItems = [
    'Low',
    'High',
    'Medium',
  ];
  var taskTitle;
  var taskDesc;
  var tasksummary;

  TextEditingController summarycontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  TextEditingController titlecontroller = TextEditingController();

  String? selecteduser;
  String? selectedPriority;
  List<String> Alluser = [];

  getUser() async {
    await FirebaseFirestore.instance
        .collection('mytask/mytask/users/')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Alluser.add(doc["name"]);
      });
    });
    print('$Alluser');
  }

  Future gotoCreateTask(context) async {
    Loader.showLoader(context);
    if (!(await InternetConnectionChecker().hasConnection)) {
      Get.back();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        title: 'Warning!!',
        desc: 'Check internet connection',
      ).show();
    } else {
      Get.back();
      await FireBase.createTask(context, titlecontroller.text, desccontroller.text,
          selecteduser, selectedPriority, summarycontroller.text)
          .then((value)  {
        titlecontroller.clear();
        desccontroller.clear();
        summarycontroller.clear();
      });
    }
  }
}
// chooseDate() async {
//   DateTime? picked Date = await showDatePicker (
//     context: Get.context!,
//     initialDate: selectedDate.value,
//     firstDate: DateTime (2000),
//     lastDate: DateTime (2024),
//   );
//   if (pickedDate != null && pickedDate != selectedDate.value) {
//     selectedDate.value = pickedDate;
//   }
// }
