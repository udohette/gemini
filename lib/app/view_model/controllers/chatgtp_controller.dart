import 'dart:async';
import 'dart:convert';
import 'package:blade/app/models/chat_gpt_model_id_list.dart';
import 'package:blade/app/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../data/repository/chatgpt/chat_gpt_list_model_repo.dart';
import '../../data/repository/chatgpt/chat_gpt_send_mssage_repo.dart';
import '../../models/chatGPT_display_msg_model.dart';
import '../../models/chat_gpt_send_message_model.dart';



class ChatGptController extends GetxController {
  final listApi = ChatGPTListModelRepo();
  final sendMsgApi = ChatGPTSendMsgRepo();
  RxBool isLoading = false.obs;
  late final data =  <Data>[].obs;
  late final choices =  <Choices>[].obs;
  late final content =  <Message>[].obs;
  final count = 0.obs;
  RxString defaultModuleId = ''.obs;
  RxString toSend = ''.obs;
  RxString messagePosition = ''.obs;
  RxInt    chatIndexPosition = 0.obs;
  RxList messages = [].obs;
  RxList displayMessage = [].obs;
  RxList chatList = [].obs;
  //List<DisplayChatModel>  chatlist2 = [].obs;
  final _apiService = ChatGPTSendMsgRepo();

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

   getModelList(){
     listApi.modelListRepository().then((value){
      print("Message From ChatGptController one $value");

      print("Value From ChatGptController one ${value.data![2].root}");
      //print("Value From ChatGptController one ${value.data[0].}");
      data.value = value.data!;
      print("Hello Data ${data.value[0].id}");
      defaultModuleId.value = data.value[0].id!;
      print("defaultModuleId.value ID+++++++++++  ${defaultModuleId.value}");

      for(var ids in data.value){
        print("Printing all IDS+++++++++++  ${ids.id}");
       // print("Printing all IDS+++++++++++  ${data.value}");
      }

      Utils.snackBar("Got", value.data![1].id.toString());
    }).onError((error, stackTrace){
      print("An Error Occurred $error");

    });

  }
   sendMessage(String message) async{
    isLoading.value = true;
    Map<dynamic,dynamic> data = {
    "model": "gpt-3.5-turbo",
    'messages': [
    {'role': 'user', 'content': message},],};

    print("Getting Response  ${data}");
    print("message Sent  $message");

     _apiService.chatGPTSendMsgRepo(data).then((value){
     isLoading.value = false;
         if (kDebugMode) {
      print("value of Choices ${value.choices.toString()}");
      print("value of id ${value.id}");
    }
       choices.value = value.choices!;
     if (value.model == "gpt-3.5-turbo-0301") {
       print("Getting data after 200  $data");

       //String botReply = data['choices'][0]['message']['content'];
       chatList = RxList.generate(choices.value.length, (index) => DisplayChatModel(
         msg: value.choices![index].message!.content,
         chatIndex: 1,
       ),
       );
       String? botReply = value.choices?.first.message?.content;
       messages.add(botReply);

       messagePosition.value = chatList.first.msg!;
       chatIndexPosition.value = chatList.first.chatIndex;
       print("Bot Reply  $botReply");
       print("Bot chatList  $chatList");

       print("Bot messagePosition  $messagePosition");
       print("Bot chatIndexPosition  $chatIndexPosition}");


       print("Choices of Value ${choices.value[0].message?.content.toString()}");
       // print("content of Value ${content.first.content.toString()}");
       // print("Choices of Index ${choices.value[0].index.toString()}");
       return chatList;


     } else {
       print("An error occurred Could not get Model input");
     }

     }).onError((error, stackTrace) {
       isLoading.value = false;
       Utils.snackBar('Error', error.toString());
       if (kDebugMode) {
         print(error.toString());
       }
     });
    }
}