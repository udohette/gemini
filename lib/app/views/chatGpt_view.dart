import 'package:blade/app/data/services/constant.dart';
import 'package:blade/app/models/chatGPT_display_msg_model.dart';
import 'package:blade/app/resources/dimensions/dimensions.dart';
import 'package:blade/app/view_model/controllers/chatgtp_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../data/services/assets_manager.dart';
import '../data/services/services.dart';
import '../resources/colors/app_color.dart';
import '../resources/components/chat_widget.dart';

class ChatGPTView extends StatefulWidget {
  const ChatGPTView({Key? key}) : super(key: key);

  @override
  State<ChatGPTView> createState() => _ChatGPTViewState();
}

class _ChatGPTViewState extends State<ChatGPTView> {
  late TextEditingController _controller;
  ChatGptController controller = Get.put(ChatGptController());
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: ()async{
          await Services.showModalSheet(context);

        }, icon: Icon(Icons.more_vert_rounded, color: AppColor.white,))],
        title: Text("ChatGPT"),
        backgroundColor: AppColor.cardColor,
        leading: Padding(padding: const EdgeInsets.all(8.0), child: Image.asset(AssetManager.openai_logo),),
      ),
      backgroundColor: AppColor.scaffoldBackground,
      body:Column(
              children: [
                Flexible(
                  child: ListView.builder(
                      itemCount:controller.chatList.length,
                      itemBuilder: (BuildContext context, int index){
                        return ChatWidget(
                                msg: controller.chatList[index].msg.toString(),
                                chatIndex: controller.chatList[index].chatIndex,
                        );
                      }),
                ),
                if(controller.isLoading.value) ...[
                  const SpinKitThreeBounce(color: AppColor.white, size: Dimensions.fs20),],
                  SizedBox(height: Dimensions.getHeight / 50,),
                  Material(
                    color: AppColor.cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(child: TextField(
                            style: TextStyle(color: AppColor.white),
                            controller: _controller,
                            onSubmitted: (value) {
                              controller.messagePosition.value = _controller.text.toString();
                                controller.isLoading.value = true;
                                controller.sendMessage(controller.messagePosition.value);
                                controller.messagePosition.value.toString();

                            },
                            decoration: InputDecoration.collapsed(
                              hintStyle: TextStyle(color: AppColor.grey),
                                hintText: "Paste TMA Question Here!"),
                          )),
                          IconButton(onPressed: (){
                            try{
                                controller.isLoading.value = true;
                                controller.chatList.add(DisplayChatModel(
                                    msg: _controller.text,
                                    chatIndex: 0));
                                //_controller.clear();
                              controller.messagePosition.value = _controller.text.toString();
                             controller.chatList.addAll( controller.sendMessage(controller.messagePosition.value));
                            }catch(error){
                              print("Error During Send $error");

                            }finally{
                                controller.isLoading.value = false;
                            }
                          }, icon: Icon(Icons.send, color: AppColor.white,))
                        ],
                      ),
                    ),
                  )
              ],
            ),
    );
  }
}
