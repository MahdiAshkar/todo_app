import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constant.dart';
import 'package:todo/controllers/add_task_contrller.dart';
import 'package:todo/models/task_model.dart';
import '../controllers/task_contrller.dart';
import '../main.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyApp.changeColorTop(Colors.white, Brightness.dark);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            MyCustomeAppbar(),
            MyTextTopWidget(),
            TaskTextFieldWidget(),
            NoteTextField(),
            Mybutton(),
          ],
        ),
      ),
    );
  }
}

class Mybutton extends StatelessWidget {
  const Mybutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      width: Get.width,
      height: 40.0,
      child: ElevatedButton(
        style: TextButton.styleFrom(backgroundColor: klightBluecolor),
        onPressed: () {
          if (Get.find<TaskContrller>().isEditing) {
            var task = Get.find<TaskContrller>()
                .taskList[Get.find<TaskContrller>().index];
            task.title = Get.find<AddTaskContller>().addTaskTitle!.text;
            task.subtitle = Get.find<AddTaskContller>().addTaskSubtitle!.text;

            Get.find<TaskContrller>()
                .taskList[Get.find<TaskContrller>().index] = task;
          } else {
            Get.find<TaskContrller>().taskList.add(TaskModel(
                title: Get.find<AddTaskContller>().addTaskTitle!.text,
                subtitle: Get.find<AddTaskContller>().addTaskSubtitle!.text,
                status: false));
          }
          Get.back();
        },
        child: Text(Get.find<TaskContrller>().isEditing ? 'Edit' : 'Add'),
      ),
    );
  }
}

class NoteTextField extends StatelessWidget {
  const NoteTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
      child: TextField(
        controller: Get.find<AddTaskContller>().addTaskSubtitle,
        maxLength: 30,
        cursorColor: klightBluecolor,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Add note',
            prefixIcon: Icon(Icons.bookmark_border),
            counter: SizedBox.shrink()),
      ),
    );
  }
}

class MyTextTopWidget extends StatelessWidget {
  const MyTextTopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20, top: 12),
      child: Text('what are you planning?',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          )),
    );
  }
}

class TaskTextFieldWidget extends StatelessWidget {
  const TaskTextFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: Get.find<AddTaskContller>().addTaskTitle,
        maxLines: 6,
        cursorColor: klightBluecolor,
        cursorHeight: 40,
        decoration: const InputDecoration(
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}

class MyCustomeAppbar extends StatelessWidget {
  const MyCustomeAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: Get.width * 0.05),
            child: Text(
              Get.find<TaskContrller>().isEditing ? 'Edit Task' : 'New Task',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        Hero(
          tag: 'hero',
          child: Material(
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close)),
          ),
        )
      ],
    );
  }
}
