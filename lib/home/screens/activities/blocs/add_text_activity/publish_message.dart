import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

///This class defines the data that is submitted with any new message.
class PublishMessage {
  //this is the collection for the actual messages
  CollectionReference messages =
      FirebaseFirestore.instance.collection('Messages');

  ///check if the tag exists
  publishNewMessage({
    User? user,
    BuildContext? context,
    String? messageInput,
    String? currentDate,
    String? currentTime,
  }) async {
    ///
    await messages.add({
      'userID': user!.uid,
      'userName': user.displayName,
      'message': messageInput,
      'date': currentDate,
      'time': currentTime,
      'likes': 0,
      'profilePic': user.photoURL,
    }).whenComplete(() {
      //return a snackBar
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Colors.green,
          content: Text('Published Successfully!'),
        ),
      );
    }).whenComplete(() {
      //now redirect to the feeds
      Navigator.of(context!).pop();
    });
  }
}
