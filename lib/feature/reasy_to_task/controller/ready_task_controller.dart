import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReadyToTaskController extends GetxController {
  var selectedDate = DateTime.now().obs;
  final Rxn<int> selected = Rxn<int>();

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

  dynamic argumentsList = Get.arguments;

  var indexnum;
  var tempMap;

  var tempMapId;

  @override
  void onInit() {
    super.onInit();
    print(argumentsList);
    indexnum = argumentsList[0];
    print(indexnum);
    tempMap = argumentsList[1];
    print(tempMap);
    tempMapId = tempMap['id'];
    print(tempMapId);
  }

  gotoInprogress(context) async {
    var id = DateTime.now().millisecondsSinceEpoch.toString();
    tempMap['id'] = id;
    await FirebaseFirestore.instance
        .collection("mytask/mytask/todo")
        .doc(tempMapId)
        .delete()
        .then((value) => {
              FirebaseFirestore.instance
                  .collection("mytask/mytask/InProgress/")
                  .doc(id)
                  .set(tempMap).then((value)  {
                    AwesomeDialog(
                      context: context,
                  dialogType: DialogType.success,
                  title: 'Task Inprogess',
                  desc: 'your task has been started inprogress',
                ).show().then((value) => {
                  Get.back()
                    });
              })
            });
  }
}
