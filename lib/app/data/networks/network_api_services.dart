
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:blade/app/data/exceptions/app_exceptions.dart';
import 'package:blade/app/data/networks/base_api_services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../resources/appurl/app_url.dart';

class NetworkAPIServices extends BaseAPIServices{

  @override
  Future getAPI(String url)async{
    if (kDebugMode) {
      print(url);
    }
    //dynamic jsonResponse;
    Map jsonResponse;
    try{
      final response = await http.get(Uri.parse(url),
          headers: {"Authorization": "Bearer ${APPUrl.apiKey}"}
      );
       jsonResponse = jsonDecode(response.body);

      jsonResponse = responseCodeResponse(response);


      if (kDebugMode) {
        print("GET API Response from NetworkAPIServices $jsonResponse");
      }

    } on SocketException{
      throw InternetException("");
    }on TimeoutException{
      throw RequestTimeOut('');
    }
    return jsonResponse;
  }

  @override
  Future postAPI(Map<dynamic, dynamic> data, String url)async{
    if (kDebugMode) {
      print(data);
      print(url);
    }
    dynamic jsonResponse;
    try{
      var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${APPUrl.apiKey}',
        },
        body: jsonEncode(data));
      jsonResponse = responseCodeResponse(response);
      if (kDebugMode) {
        print("SendMessageAPI Response from NetworkAPIServices $jsonResponse");
      }
    }on SocketException{
      throw InternetException("");
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }
    return jsonResponse;
  }

  dynamic responseCodeResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      case 500:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;

    }

  }

}