import 'package:flutter/material.dart';
import 'package:flutter_country_app/screens/users_screen.dart';
import 'package:flutter_country_app/widgets/buttons.dart';
import 'package:get/get.dart';

import 'home/home_controler.dart';

class Continents extends StatelessWidget {
  const Continents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller){
      return Scaffold(
        drawer: Drawer(
          child: Container(
            child: Column(
              children: const [
                Text('data', style: TextStyle(color: Colors.white, backgroundColor: Colors.blue),),
                Text('Second', style: TextStyle(color: Colors.white, backgroundColor: Colors.blue)),
              ],
            ),
          ),
        ),
        floatingActionButton:  FloatingActionButton(
          onPressed: (){

            Get.to(() => const UsersScreen());

          },
         backgroundColor: Colors.red,
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainButton(btn_name: "Asia", controller: controller,clr: Colors.blue,),
                    MainButton(btn_name: "Americas", controller: controller,clr: Colors.green,),
                    MainButton(btn_name: "Oceania", controller: controller,clr: Colors.yellow,),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MainButton(btn_name: "Africa", controller: controller, clr: Colors.grey,),
                    MainButton(btn_name: "Europe", controller: controller, clr: Colors.red,),
                    MainButton(btn_name: "Antarctic", controller: controller, clr: Colors.orange,),
                  ]),
            ]
          ),
        ),
      );}
    );
  }
}
