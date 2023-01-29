import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EditTaskController extends GetxController {
  final GlobalKey<FormState> editFormKey = GlobalKey<FormState>();

  dynamic argumentsList = Get.arguments;
  var selectedDate = DateTime.now().obs;
  final requiredValidator =
      RequiredValidator(errorText: 'this field is required');
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

  validate() {
    if (editFormKey.currentState!.validate()) {
      print("form validate");
    }
  }

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

  var indexNum;

  var dataFromTodo;

  @override
  void onInit() async {
    getUser();
    indexNum = argumentsList[0];
    dataFromTodo = argumentsList[1];
    // tempMapId = tempMap['id'];
    // print(tempMapId);
    titlecontroller.text = dataFromTodo['title'];
    desccontroller.text = dataFromTodo['description'];
    summarycontroller.text = dataFromTodo['summary'];
    super.onInit();
  }

  updateTask(context) async {
    if (editFormKey.currentState!.validate()) {
      Map<String, dynamic> EditTaskData = {
        "title": titlecontroller.text,
        "description": desccontroller.text,
        "asignee": selecteduser,
        "priority": selectedPriority,
        "summary": summarycontroller.text,
      };

      await FirebaseFirestore.instance
          .collection("mytask/mytask/todo")
          .doc(dataFromTodo['id'])
          .update(EditTaskData)
          .then((value) => {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  title: 'Success',
                  desc: 'Your task has been successfully created',
                ).show().then((value) => {
                  Get.back()
                })
              });
    }
  }
}
