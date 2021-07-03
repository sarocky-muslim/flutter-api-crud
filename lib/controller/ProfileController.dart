import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:dio/dio.dart';
import '../API.dart';
import '../model/ProfileModel.dart';
import 'package:path_provider/path_provider.dart';

class ProfileController {
  var dio = Dio();

  Future<MultipartFile> createMultipartFile(
      String tempFilePath, String newFileName) async {
    try {
      var multipartFile =
          await MultipartFile.fromFile(tempFilePath, filename: newFileName);
      return multipartFile;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<ProfileModel> postFormData(Map<String, dynamic> model) async {
    try {
      var formData = FormData.fromMap(model);
      var myOption = Options(responseType: ResponseType.plain);
      final response =
          await dio.post(API.image, data: formData, options: myOption);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.data.toString());
        return ProfileModel.fromJson(json);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<File> urlToFile(String url) async {
    String filename = "download.jpg";
    Directory tempDir = await getTemporaryDirectory();
    String pathName = path.join(tempDir.path, filename);

    try {
      var myOption = Options(responseType: ResponseType.bytes);
      final response = await dio.get(url, options: myOption);
      if (response.statusCode == 200) {
        File file = new File(pathName);
        file.writeAsBytesSync(response.data);
        return file;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
