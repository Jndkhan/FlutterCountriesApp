import 'package:flutter_country_app/models/country_model.dart';
import 'package:flutter_country_app/models/user_info_model.dart';
import 'package:flutter_country_app/models/user_model.dart';
import 'package:flutter_country_app/service/service.dart';
import 'package:flutter_country_app/sqflite/database_helper.dart';
import 'package:flutter_country_app/utils/constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<CountryModel> model = [];
  List<UserModel> usermodel = [];
  List<UserInfoModel> userInfoModel = [];


  @override
  void onInit() {
    super.onInit();
    //getUsers();
  }

  getCountries() {
    Service().getCountries(before: () {
      print("before Loading");
    },
     onSuccess: (data) async{
      //DatabaseHelper.instance.clearDatabase();
      for (int i = 0; i < data.length; i++) {
        /*DatabaseHelper.instance.insertCountries({
          DatabaseHelper.colCountryName : data[i].name.common,
          DatabaseHelper.colCountryRegion: data[i].region,
          DatabaseHelper.colCountryFlagPngUrl: data[i].flags.png
        });*/
        if(Constants.region == data[i].region){
          model.add(data[i]);
        }

      }
   //   List<Map<String, dynamic>> result = await DatabaseHelper.instance.retrieveCountries();

      //model = result;
      //print("size is: ${model.length}");
      update();
    },
     onError: (error) {
      print("this error occurd: $error");
    });
  }


  Future<List<UserModel>> getUsers() async{
    Service().getUsers(before: () {
      print("before send");
    }, onSuccess: (data) {
      print("success send");
      for (int i = 0; i < data.length; i++) {
        usermodel.add(data[i]);
      }
      update();
    }, onError: (error) {
      print("the error is $error");
    });
    return usermodel;
  }


  Future<List<UserInfoModel>> getUsersInfoDetails() async{
    Service().getUsersInfoDetails(before: () {
      print("before send");
    }, onSuccess: (data) {
      print("success send");
      for (int i = 0; i < data.length; i++) {
        userInfoModel.add(data[i]);
      }
      update();
    }, onError: (error) {
      print("the error is $error");
    });
    return userInfoModel;
  }
}
