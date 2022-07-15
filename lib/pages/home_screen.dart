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
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: Stack(alignment: Alignment.bottomCenter, children: [
        Container(
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
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: fontcolor),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 45),
                child: Text(
                  'Tasks ',
                  style: TextStyle(fontSize: 15, color: fontcolor),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: Get.width,
          height: Get.height * 0.65,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0))),
        )
      ])),
    );
  }
}
