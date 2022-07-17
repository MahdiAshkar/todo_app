import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTaskContller extends GetxController {
  TextEditingController? addTaskTitle;
  TextEditingController? addTaskSubtitle;
  @override
  void onInit() {
    addTaskTitle = TextEditingController();
    addTaskSubtitle = TextEditingController();
    super.onInit();
  }
}
