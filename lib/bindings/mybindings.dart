import 'package:get/get.dart';
import 'package:todo/controllers/add_task_contrller.dart';
import '../controllers/task_contrller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AddTaskContller());
    Get.lazyPut(() => TaskContrller());
  }
}
