import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SpinKitWave(
          size: 25,
          color: Colors.red,
        ),
        Text(
          'Something went wrong...',
          style:
              TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Battambang'),
        ),
      ],
    ));
  }
}
