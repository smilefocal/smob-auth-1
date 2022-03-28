import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strathmoresesc/home/screens/my_drawer.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key, required this.user}) : super(key: key);
  //the user object.
  final User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown,
        elevation: 0.0,
        title: const Text(
          'SESC COMMUNITY',
          style: TextStyle(fontFamily: 'Battambang'),
        ),
      ),
      drawer: MyDrawer(
        user: user,
      ),
    ));
  }
}
