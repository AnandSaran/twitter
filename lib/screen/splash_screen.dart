import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:twitter/constants/constant.dart';
import 'package:twitter/screen/widget.dart';
import 'package:twitter/util/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initFirebase(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: new BoxDecoration(color: Colors.blue),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widgetLogo()
                //your widgets here...
              ],
            ))));
  }

  initFirebase(BuildContext context) async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp().whenComplete(() => showLoadingScreen(context));
  }

  void showLoadingScreen(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 2000));
    Navigation().popAndPushNamed(context, ROUTE_LOADING);
  }
}
