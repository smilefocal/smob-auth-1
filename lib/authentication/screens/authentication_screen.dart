import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:strathmoresesc/authentication/bloc/auth_bar_cubit.dart';
import 'package:strathmoresesc/authentication/bloc/authentication.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.width / 5.2),
            scrollDirection: Axis.vertical,
            children: [
              const Text(
                'sesc community edition .',
                style: TextStyle(
                  color: Colors.brown,
                  fontFamily: 'Bangers',
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<AuthBarCubit, bool>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.grey)),
                        duration: const Duration(seconds: 3),
                        height: MediaQuery.of(context).size.width + 105,
                        width: state ? 30 : 50,
                        child: Column(
                          children: [
                            Lottie.asset(
                              'assets/images/loading.json',
                              height: 50,
                              width: 50,
                            ),
                            GestureDetector(
                              onTap: () => state
                                  ? context.read<AuthBarCubit>().isSignUpMode()
                                  : context.read<AuthBarCubit>().isLoginMode(),
                              child: AnimatedContainer(
                                decoration: BoxDecoration(
                                    color: Colors.brown,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(color: Colors.brown)),
                                duration: const Duration(seconds: 2),
                                width: 25,
                                height: MediaQuery.of(context).size.width,
                              ),
                            ),
                            RotatedBox(
                              quarterTurns: 2,
                              child: Lottie.asset(
                                'assets/images/loading.json',
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 80,
                        child: Column(
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                label: Text('Email Address'),
                              ),
                            ),
                            const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                label: Text('Password'),
                              ),
                            ),
                            //if the state is false, then that means we are creating a new
                            // account hence the syntax.
                            !state
                                ? const TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      label: Text('Confirm Password'),
                                    ),
                                  )
                                : const SizedBox(),
                            const SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 80,
                              child: OutlinedButton(
                                onPressed: () {},
                                child: !state
                                    ? const Text('Create Account')
                                    : const Text('Login'),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 80,
                              child: TextButton(
                                onPressed: () {},
                                child: !state
                                    ? const SizedBox()
                                    : const Text('Forgot Password'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              OutlinedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential =
                        await Authentication().signInWithGoogle();
                    Navigator.of(context).pushNamed('/homeFeeds',
                        arguments: userCredential.user);
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('$e')));
                  }
                },
                child: const Text('Continue with Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
