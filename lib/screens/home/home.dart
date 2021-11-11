import 'package:flutter/material.dart';
import 'package:flutter_country_app/screens/home/home_controler.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(builder: (controller)
    {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: size.width,
            height: size.height,
            child: controller.model.isEmpty
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
              itemBuilder: (context, index) {
                return Container(

                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Card(
                    color: Colors.white,
                    shadowColor: Colors.blueGrey,
                    elevation: 5,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      leading: Container(
                        width: 80,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(controller.model[index].flags.png),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      title: Text(controller.model[index].name.common, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),),
                      trailing: Text(controller.model[index].region),
                    ),
                  ),
                );
              },
              itemCount: controller.model.length,
            ),
          ),
        ),
      );
    });
  }
}