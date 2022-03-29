import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonSection extends StatelessWidget {
  const FloatingActionButtonSection({Key? key, required this.user})
      : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.brown,
      onPressed: () =>
          Navigator.of(context).pushNamed('/addActivity', arguments: user),
      child: const Icon(Icons.workspaces_outline),
    );
  }
}
