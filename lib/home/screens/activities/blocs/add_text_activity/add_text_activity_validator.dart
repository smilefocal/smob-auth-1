import 'dart:async';

class AddTextActivityValidator {
  final validateMessage = StreamTransformer<String, String>.fromHandlers(
      handleData: (message, sink) {
    if (message.length > 1) {
      sink.add(message);
    } else {
      sink.addError('Write something ...');
    }
  });
}
