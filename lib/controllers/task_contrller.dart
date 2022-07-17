import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/models/task_model.dart';

class TaskContrller extends GetxController {
  RxList taskList = <TaskModel>[].obs;
  bool isEditing = false;
  int index = 0;
  @override
  void onInit() {
    var box = GetStorage();
    if (box.read('task') != null) {
      var listTask = box.read('task');
      for (var task in listTask) {
        taskList.add(TaskModel.fromJson(task));
      }
    }

    ever(taskList, (value) {
      box.write('task', taskList.toJson());
    });
    super.onInit();
  }
}
