import 'dart:convert';

import 'package:dio/dio.dart';
import '../API.dart';
import '../model/UserModel.dart';

class UserController {
  var dio = Dio();

  Future<List<UserModel>> getAll() async {
    try {
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.get(API.user, options: myOption);
      if (response.statusCode == 200) {
        Iterable json = jsonDecode(response.data.toString());
        final result = json.map((user) => UserModel.fromJson(user)).toList();
        return result;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<UserModel> getOne(int id) async {
    try {
      var path = API.user + id.toString();
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.get(path, options: myOption);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.data.toString());
        return UserModel.fromJson(json);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<UserModel> post(Map<String, dynamic> model) async {
    try {
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.post(API.user, data: model, options: myOption);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.data.toString());
        return UserModel.fromJson(json);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<UserModel> put(int id, Map<String, dynamic> model) async {
    try {
      var path = API.user + id.toString();
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.put(path, data: model, options: myOption);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.data.toString());
        return UserModel.fromJson(json);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Map<String, dynamic>> delete(int id) async {
    try {
      var path = API.user + id.toString();
      var myOption = Options(responseType: ResponseType.plain);
      final response = await dio.delete(path, options: myOption);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.data.toString());
        return json;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
