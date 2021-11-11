import 'package:flutter/material.dart';
import 'package:flutter_country_app/screens/home/home.dart';
import 'package:flutter_country_app/screens/home/home_controler.dart';
import 'package:flutter_country_app/screens/home/home_grid.dart';
import 'package:flutter_country_app/utils/constants.dart';

class MainButton extends StatelessWidget {
  String btn_name;
  Color clr;
  HomeController controller;

  MainButton(
      {required this.btn_name,
      Key? key,
      required this.controller,
      required this.clr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sideLength = 50;
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: MaterialButton(
        onPressed: () {
          print("clicked on $btn_name");
          Constants.region = btn_name;
          controller.model.clear();
          controller.getCountries();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const HomeGrid()));
        },
        color: clr,
        child: Center(
          child: Text(btn_name, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
