import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constant.dart';
import 'package:todo/controllers/add_task_contrller.dart';
import 'package:todo/controllers/task_contrller.dart';
import 'package:todo/main.dart';

var taskcontroll = Get.find<TaskContrller>();

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MyFloatActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
          child: Stack(
              alignment: Alignment.bottomCenter,
              children: const [TopSectionWidget(), BottomSectionWidget()])),
    );
  }
}

class MyFloatActionButton extends StatelessWidget {
  const MyFloatActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyApp.changeColorTop(klightBluecolor, Brightness.light);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: FloatingActionButton(
        heroTag: 'hero',
        onPressed: () {
          taskcontroll.isEditing = false;
          Get.find<AddTaskContller>().addTaskTitle!.text = '';
          Get.find<AddTaskContller>().addTaskSubtitle!.text = '';
          Get.toNamed('/addscreen')!.then((value) =>
              MyApp.changeColorTop(klightBluecolor, Brightness.light));
        },
        backgroundColor: const Color.fromARGB(255, 5, 17, 180),
        elevation: 0,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BottomSectionWidget extends StatelessWidget {
  const BottomSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(1),
      width: Get.width,
      height: Get.height * 0.65,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          )),
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            // color: Colors.red,
          ),
          margin:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 50),
          child: Obx(() {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onLongPress: () {
                      myDialogDelete(index);
                    },
                    onTap: () {
                      taskcontroll.isEditing = true;
                      taskcontroll.index = index;
                      Get.find<AddTaskContller>().addTaskTitle!.text =
                          taskcontroll.taskList[index].title;
                      Get.find<AddTaskContller>().addTaskSubtitle!.text =
                          taskcontroll.taskList[index].subtitle;
                      Get.toNamed('/addscreen');
                    },
                    title: Text(taskcontroll.taskList[index].title),
                    subtitle: Text(taskcontroll.taskList[index].subtitle),
                    trailing: Checkbox(
                      side: const BorderSide(width: 1, color: Colors.black),
                      activeColor: klightBluecolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      value: taskcontroll.taskList[index].status,
                      onChanged: (value) {
                        taskcontroll.taskList[index].status =
                            !taskcontroll.taskList[index].status;
                        taskcontroll.taskList[index] =
                            taskcontroll.taskList[index];
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox.shrink();
                  // const Divider(
                  //   color: Colors.black54,
                  //   height: 1,
                  // );
                },
                itemCount: taskcontroll.taskList.length);
          })),
    );
  }

  Future<dynamic> myDialogDelete(int index) {
    return Get.defaultDialog(
        title: 'حذف',
        titleStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red[800]),
        middleText: 'آیا می خواهید این یادداشت را حذف کنید؟',
        confirmTextColor: Colors.black87,
        buttonColor: Colors.white60,
        radius: 15,
        cancelTextColor: Colors.black,
        textCancel: 'آره',
        textConfirm: 'نه',
        onCancel: () {
          taskcontroll.taskList.removeAt(index);
        },
        onConfirm: () {
          Get.back();
        });
  }
}

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: klightBluecolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: kbuttontopcolor,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: kbuttontopcolor,
                      )),
                ]),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, top: 20),
            child: CircleAvatar(
              backgroundColor: kcircularAvatarcolor,
              radius: 25,
              child: Center(child: Icon(Icons.bookmarks)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 45),
            child: Text(
              'All',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: fontcolor),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Obx((() {
              return Text(
                '${taskcontroll.taskList.length} Tasks ',
                style: const TextStyle(fontSize: 15, color: fontcolor),
              );
            })),
          )
        ],
      ),
    );
  }
}
