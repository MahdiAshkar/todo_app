import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constant.dart';
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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: Get.width,
      height: 40.0,
      child: ElevatedButton(
        style: TextButton.styleFrom(backgroundColor: klightBluecolor),
        onPressed: () {},
        child: const Text('Add'),
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
    return const Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 25),
      child: TextField(
        maxLength: 30,
        cursorColor: klightBluecolor,
        decoration: InputDecoration(
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
      padding: EdgeInsets.only(left: 20, top: 30),
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
    return const Padding(
      padding: EdgeInsets.only(left: 20, top: 30, right: 20),
      child: TextField(
        maxLines: 6,
        cursorColor: klightBluecolor,
        cursorHeight: 40,
        decoration: InputDecoration(
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
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 65.0),
            child: Text(
              'New Task',
              textAlign: TextAlign.center,
              style: TextStyle(
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
