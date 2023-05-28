import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../data/exceptions/app_exceptions.dart';
import '../../data/networks/network_api_services.dart';
import '../../data/repository/chatgpt/list_models.dart';
import '../../resources/appurl/app_url.dart';

class ChatGptController extends GetxController {
  final _api = ListModelsRepository();
  final _apiService = NetworkAPIServices();
  RxBool isLoading = false.obs;



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getModelList()async{
    // _api.modelListRepository().then((value)async{
    //   print("Message From ChatGptController $value");
    //
    // }).onError((error, stackTrace){
    //   print("An Error Occurred $error");
    //
    // });


    _apiService.getAPI("${APPUrl.base_url}/models").then((value){
      
      if(value['error'] != null){
        print("value Error ${value['error']['message']}");
        throw HttpException(value['error']['message']);

      }
      print("Message From ChatGptController $value");


    }).onError((error, stackTrace){
      print("An Error Occurred $error");
    });

  }

}