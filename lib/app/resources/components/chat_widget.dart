import 'package:blade/app/resources/components/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/services/assets_manager.dart';
import '../colors/app_color.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key, required this.msg, required this.chatIndex}) : super(key: key);
  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ?  AppColor.scaffoldBackground: AppColor.cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                chatIndex == 0 ? Image.asset(AssetManager.person, height: 30, width: 30,): Image.asset(AssetManager.chat_logo, height: 30, width: 30,),
                SizedBox(width: 8,),
                Expanded(child: TextWidget(label: msg)
                ),
                chatIndex == 0 ? SizedBox.shrink(): Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Icon(Icons.thumb_up_alt_outlined, color: AppColor.white,),
                  SizedBox(width: 5,),
                  Icon(Icons.thumb_down_alt_outlined, color: AppColor.white,),
                ],)
              ],
            ),
          ),

        ),

      ],
    );
  }
}
