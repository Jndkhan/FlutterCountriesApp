import 'package:flutter/material.dart';
import 'package:flutter_country_app/screens/home/home_controler.dart';
import 'package:flutter_country_app/utils/constants.dart';
import 'package:flutter_country_app/utils/my_text_style.dart';
import 'package:get/get.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:  Text(Constants.region, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
        ),
          body: Container(
        width: size.width,
        height: size.height,
        child: (controller.model.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {

                  return InkWell(
                    onTap: () {
                      Get.snackbar("Countries Grid View",
                          controller.model[index].name.common,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.blue,
                          colorText: Colors.white,
                          margin: const EdgeInsets.symmetric(horizontal: 8));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        color: Colors.white,
                        elevation: 8,
                        shadowColor: Colors.grey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            controller.model[index].flags.png),
                                        fit: BoxFit.contain)),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Text(
                                  controller.model[index].name.common,
                                  style: MyTextStyle.countryNameTextStyle,
                                )),
                            Text(
                              controller.model[index].region,
                              style: MyTextStyle.regionTextStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: controller.model.length,
              ),
      ));
    });
  }
}
