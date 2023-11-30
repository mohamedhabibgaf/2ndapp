import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hupptest/View/splash/splash.dart';
import '../Widgets/Loader.dart';
import 'home/home.dart';

class Root extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RootState();
  }
}

class RootState extends State<Root> {
  Widget launchWidget = LoaderWidget();

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  checkUser() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      print(user);
      if (user != null) {
        setState(() {
          launchWidget = Home(
            user: user,
          );
        });
      } else {
        setState(() {
          launchWidget = Splash();
        });
      }
    } catch (e) {
      print("ERROR IN LAUNCH $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: launchWidget);
  }
}
