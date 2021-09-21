import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter/bloc/login/login_bloc.dart';
import 'package:twitter/screen/screens.dart';

import 'constants/constant.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: APP_NAME,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: ROUTE_SPLASH,
        routes: {
          ROUTE_SPLASH: (context) => SplashScreen(),
          ROUTE_LOADING: (context) => BlocProvider<LoginBLoc>(
              create: (context) {
                return LoginBLoc(
                    authenticationRepository: AuthenticationRepository());
              },
              child: LoadingScreen(
                  authenticationRepository: AuthenticationRepository())),
        });
  }
}
