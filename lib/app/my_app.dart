
import 'package:flutter/material.dart';
import 'package:flutter_country_app/bindings/main_binding.dart';
import 'package:flutter_country_app/screens/continents.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      initialBinding: MainBinding(),
      getPages: [
        GetPage(name: '/', page: () => const Continents()),
      ],


    );
  }
}
