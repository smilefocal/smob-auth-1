import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strathmoresesc/authentication/bloc/auth_bar_cubit.dart';
import 'package:strathmoresesc/authentication/screens/authentication_screen.dart';
import 'package:strathmoresesc/home/screens/feeds.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<AuthBarCubit>(create: (context) => AuthBarCubit()),
            ],
            child: const AuthenticationScreen(),
          ),
        );
      case '/homeFeeds':
        //if the argument received is of type user, then we push it.
        if (args is User) {
          return MaterialPageRoute(
            builder: (_) => FeedsScreen(user: args),
          );
        }
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
    return MaterialPageRoute(
      builder: (_) => const ErrorScreen(),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Path undefined',
          style: TextStyle(
            fontFamily: 'Battambang',
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
