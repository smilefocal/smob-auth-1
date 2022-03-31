import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SpinKitWave(
          size: 25,
          color: Colors.green,
        ),
        Text(
          'Loading...',
          style:
              TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Battambang'),
        ),
      ],
    ));
  }
}
