import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:twitter/screen/post_screen.dart';
import 'package:twitter/screen/login_screen.dart';
import 'package:twitter/screen/widget/widget.dart';

class LoadingScreen extends StatefulWidget {
  final AuthenticationRepository authenticationRepository;

  const LoadingScreen({Key? key, required this.authenticationRepository})
      : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return _widgetUserState();
  }

  _widgetUserState() {
    return StreamBuilder(
        stream: widget.authenticationRepository.user,
        builder: (context, AsyncSnapshot<User> snapshot) {
          if (!snapshot.hasData) {
            return _widgetLoading();
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return PostScreen();
          } else {
            return LoginScreen();
          }
        });
  }

  _widgetLoading() {
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
}
