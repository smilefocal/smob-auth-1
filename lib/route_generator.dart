import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strathmoresesc/authentication/bloc/auth_bar_cubit.dart';
import 'package:strathmoresesc/authentication/screens/authentication_screen.dart';
import 'package:strathmoresesc/home/screens/feeds.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //get arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthBarCubit(),
            child: const AuthenticationScreen(),
          ),
        );
      case '/homeFeeds':
        return MaterialPageRoute(
          builder: (_) => const FeedsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Path undefined'),
      ),
    );
  }
}
