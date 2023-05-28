import 'package:get/get.dart';

class Message extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'hello world!',
      'tell_me':'Tell me please',
      'blade':'Blade'
    },
    'es_ES':{
      'hello': 'hola Mondu'
    },
  };

}