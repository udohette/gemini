import 'package:blade/app/view_model/controllers/message_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HumataiView extends StatefulWidget {
  const HumataiView({Key? key}) : super(key: key);

  @override
  State<HumataiView> createState() => _HumataiViewState();
}

class _HumataiViewState extends State<HumataiView> {
  MessageController controller = Get.put(MessageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Translate")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("hello".tr, style: TextStyle(fontSize: 28),),
          
          ElevatedButton(onPressed: (){
            controller.changeLanguage("en", "US");

          }, child: Text("English")),

          ElevatedButton(onPressed: (){
            controller.changeLanguage("es", "ES");

          }, child: Text("French"))
          
        ],
      ),
    );
  }
}

