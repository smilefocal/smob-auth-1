import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:strathmoresesc/home/screens/activities/blocs/add_text_activity/add_text_activity_validator.dart';
import 'package:strathmoresesc/home/screens/activities/blocs/add_text_activity/add_text_date_formatter.dart';
import 'package:strathmoresesc/home/screens/activities/blocs/add_text_activity/publish_message.dart';

class AddTextActivityBloc extends Object with AddTextActivityValidator {
  final _message = BehaviorSubject<String>();

  //add the message to stream
  Stream<String> get message => _message.stream.transform(validateMessage);
  //
  Stream<bool> get submitValidMessage => message.map((a) => true);
  //change data
  Function(String) get changeMessage => _message.sink.add;

  submitMessage(User user, BuildContext context) {
    final validMessage = _message.value;
    final currentDate = AddTextDateFormatter().currentDate();
    final currentTime = AddTextDateFormatter().currentTime();

    PublishMessage().publishNewMessage(
      user: user,
      context: context,
      messageInput: validMessage,
      currentDate: currentDate,
      currentTime: currentTime,
    );
  }

  dispose() {
    _message.close();
  }
}
