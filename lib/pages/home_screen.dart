import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: klightBluecolor,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: Stack(children: [
        SizedBox(
          width: Get.width,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
            ],
          ),
        )
      ])),
    );
  }
}
