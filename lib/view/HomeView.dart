import 'package:flutter/material.dart';
import 'UserView.dart';
import 'ProfileView.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  _onPressedUser() {
    var widget = (context) => UserView();
    var route = MaterialPageRoute(builder: widget);
    Navigator.push(context, route);
  }

  _onPressedProfile() {
    var widget = (context) => ProfileView();
    var route = MaterialPageRoute(builder: widget);
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _onPressedUser,
                child: Text('User View'),
              ),
              ElevatedButton(
                onPressed: _onPressedProfile,
                child: Text('Profile View'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
