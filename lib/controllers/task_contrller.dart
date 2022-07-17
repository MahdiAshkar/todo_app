import 'package:get/get.dart';
import 'package:todo/models/task_model.dart';

class TaskContrller extends GetxController {
  RxList taskList = <TaskModel>[].obs;
  bool isEditing = false;
  int index = 0;
}
