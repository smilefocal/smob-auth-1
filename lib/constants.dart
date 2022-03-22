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
    ;
  }
}
