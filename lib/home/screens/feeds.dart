import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:strathmoresesc/home/screens/activities/floating_action_button_section.dart';
import 'package:strathmoresesc/home/screens/activities/screens/feed_card.dart';
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
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_list_sharp),
            )
          ],
        ),
        drawer: MyDrawer(
          user: user,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: const [
            FeedCard(),
          ],
        ),
        floatingActionButton: FloatingActionButtonSection(user: user),
      ),
    );
  }
}
