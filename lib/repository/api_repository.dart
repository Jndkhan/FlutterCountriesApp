import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiRepository {
  final String url;

  ApiRepository({required this.url});

  final _dio = Dio();

  get(
      {Function()? beforeSend,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError}) {
    _dio.get(url).then((response) async {
      if (beforeSend != null) {
        print("inside repo");
        beforeSend;
      }
      if (onSuccess != null) {
        print("inside on success ${response.statusCode}");
        if (response.statusCode == 200) {
          onSuccess(response.data);
        }
      }
    }).catchError((error) {
      print(error);
      if (onError != null) {
        onError(Icons.error);
      }
    });
  }
}
