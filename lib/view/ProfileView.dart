import 'package:flutter/material.dart';
import '../controller/ProfileController.dart';
import 'package:path/path.dart' as path;

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var _profileController = new ProfileController();
  String imageUrl =
      "https://st.depositphotos.com/1428083/2946/i/600/depositphotos_29460297-stock-photo-bird-cage.jpg";

  Future<Map<String, dynamic>> _setFormData() async {
    String fileExtension = path.extension(imageUrl);
    String newFileName = "myImage" + fileExtension;
    try {
      var tempFile = await _profileController.urlToFile(imageUrl);
      var multipartFile = await _profileController.createMultipartFile(
          tempFile.path, newFileName);
      Map<String, dynamic> formData = {
        "name": "Sunil",
        "age": 35,
        "image": multipartFile,
      };
      return formData;
    } catch (e) {
      print(e);
      return {};
    }
  }

  Future _createProfile() async {
    try {
      await _setFormData().then((formData) async {
        var profile = await _profileController.postFormData(formData);
        print(profile.toJson());
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User View'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: _createProfile,
                  child: Text('MultipartFile Form Request')),
            ],
          ),
        ),
      ),
    );
  }
}
