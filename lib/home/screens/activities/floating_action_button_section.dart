import 'package:flutter/material.dart';

class FloatingActionButtonSection extends StatelessWidget {
  const FloatingActionButtonSection({Key? key, required this.buildContext})
      : super(key: key);
  final BuildContext buildContext;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.brown,
      onPressed: () {},
      child: const Icon(Icons.workspaces_outline),
    );
  }
}
