

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home_controler.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
            title: const Text(
              "JsonPlaceHolder",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            width: size.width,
            height: size.height,
            child: controller.usermodel.isEmpty
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    leading: Container(
                      child: Text(controller.usermodel[index].id.toString()),
                    ),
                    title: Text(controller.usermodel[index].title),
                    subtitle: Text(controller.usermodel[index].body),
                  ),
                );
              },
              itemCount: controller.usermodel.length,
            ),
          ),
        ),
      );
    });
  }
}
