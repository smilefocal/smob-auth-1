import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:strathmoresesc/authentication/bloc/authentication.dart';
import 'package:strathmoresesc/constants.dart';
import 'package:strathmoresesc/route_generator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            User? user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context)
                    .pushReplacementNamed('/homeFeeds', arguments: user);
              });
            } else {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacementNamed('/');
              });
            }
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }
          return const LoadingScreen();
        },
        future: Authentication.initializeFirebase(context),
      ),
    );
  }
}
