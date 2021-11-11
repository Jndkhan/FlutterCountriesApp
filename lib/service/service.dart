import 'package:flutter_country_app/models/country_model.dart';
import 'package:flutter_country_app/models/user_model.dart';
import 'package:flutter_country_app/repository/api_repository.dart';

class Service {
  final String baseUrl = "https://restcountries.com/v3.1/all";
  final String baseUrlPlaceHolder = "https://jsonplaceholder.typicode.com/posts/";

  Future getCountries(
      {Function()? before,
      Function(List<CountryModel> mdlcountry)? onSuccess,
      Function(dynamic error)? onError}) async {
    ApiRepository(url: baseUrl).get(beforeSend: () {
      if (before != null) {
        print("inside before send in service");
        before;
      }
    }, onSuccess: (data) {
      if (onSuccess != null) {
        // onSuccess((data as List).map((response) => User.fromJson(response)).toList());
        print("inside on success in service");

        onSuccess((data as List).map((e) => CountryModel.Json(e)).toList());
      }
    }, onError: (error) {

      if (onError != null) {
        print("inside on error in service: $error");
        onError(error);
      }
    });
  }


  Future getUsers(
      {Function()? before,
        Function(List<UserModel> mdlUser)? onSuccess,
        Function(dynamic data)? onError}) async => ApiRepository(url: baseUrlPlaceHolder).get(
      beforeSend: () {
        if (before != null) {
          print("before send");
          before;
        }
      }, onSuccess: (data) {
    if (onSuccess != null) {
      print("onSuccess send");
      onSuccess((data as List).map((e) => UserModel.Json(e)).toList());
    }
  }, onError: (error) {
    print("error send");
    if (onError != null) {
      onError(error);
    }
  });


}
