import 'package:flutter_country_app/screens/home/home_controler.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }

}
