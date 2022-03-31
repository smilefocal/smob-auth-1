import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:strathmoresesc/home/screens/activities/floating_action_button_section.dart';
import 'package:strathmoresesc/home/screens/activities/screens/error_screen.dart';
import 'package:strathmoresesc/home/screens/activities/screens/feed_card.dart';
import 'package:strathmoresesc/home/screens/activities/screens/loading_screen.dart';
import 'package:strathmoresesc/home/screens/my_drawer.dart';

class FeedsScreen extends StatelessWidget {
  FeedsScreen({Key? key, required this.user}) : super(key: key);
  //the user object.
  final User user;
  //now getting all the text messages from this path.
  final Stream<QuerySnapshot> messages =
      FirebaseFirestore.instance.collection('Messages').snapshots();
  @override
  Widget build(BuildContext context) {
    //
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
        body: StreamBuilder<QuerySnapshot>(
          stream: messages,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            }
            if (snapshot.hasError) {
              return const ErrorScreen();
            }
            return ListView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return FeedCard(
                    data: data,
                  );
                }).toList());
          },
        ),
        floatingActionButton: FloatingActionButtonSection(user: user),
      ),
    );
  }
}
