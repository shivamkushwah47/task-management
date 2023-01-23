import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CreateTaskController extends GetxController {
  var selectedDate = DateTime.now().obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  date(){
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
        helpText: 'Select DOB',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'DOB',
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
