import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: SpinKitChasingDots(
            size: 50,
            color: Colors.red,
            duration: Duration(
              seconds: 5,
            ),
          ),
        ),
      ),
    );
  }
}

///This is the button style used for project
///
ButtonStyle buttonStyle = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: const BorderSide(color: Colors.red))));
