import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/bloc/login/login_bloc.dart';
import 'package:twitter/bloc/login/login_event.dart';
import 'package:twitter/bloc/login/login_state.dart';
import 'package:twitter/constants/constant.dart';
import 'package:twitter/screen/widget/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBLoc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = BlocProvider.of<LoginBLoc>(context);
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
                widgetLogo(),
                dividerSpace(height: 40),
                _widgetGoogleSignIn(),
                //your widgets here...
              ],
            ))));
  }

  Widget _widgetGoogleSignIn() {
    return Center(
        child: ElevatedButton.icon(
      icon: SvgPicture.asset(ICON_GOOGLE,
          width: 24, height: 24, color: Colors.red),
      label: Text(SIGN_IN_WITH_GOOGLE, style: TextStyle(color: Colors.black)),
      onPressed: () {
        // context.read<LoginCubit>().logInWithGoogle();
        _bloc.add(GoogleSignIn());
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
      ),
    ));
  }
}
