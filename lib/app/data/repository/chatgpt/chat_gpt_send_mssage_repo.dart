import 'dart:convert';

import 'package:blade/app/resources/appurl/app_url.dart';
import 'package:flutter/foundation.dart';

import '../../../models/chat_gpt_send_message_model.dart';
import '../../networks/network_api_services.dart';

class ChatGPTSendMsgRepo{
  final _apiService = NetworkAPIServices();

  Future<SendMessageModel> chatGPTSendMsgRepo(Map<dynamic, dynamic> data)async{
    dynamic response = await _apiService.postAPI(data, "${APPUrl.base_url}/chat/completions");
    if (kDebugMode) {
      print("Json Response with Messages $response");
    }
    if (kDebugMode) {
      print("Json Map Response with Messages $response");
    }
    return SendMessageModel.fromJson(response);
  }
}