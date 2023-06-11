import 'package:blade/app/resources/components/text_widget.dart';
import 'package:blade/app/view_model/controllers/chatgtp_controller.dart';
import 'package:flutter/material.dart';


   const Model1endpoint = "https://api.openai.com/v1/";
   const aiToken = "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";

//   List<String> models= <String>[
//     "Model1",
//     "Model2",
//     "Model3",
//     "Model4",
//     "Model5",
//     "Model6",
//
//   ];
//
// List<DropdownMenuItem<String>>? get getModelsItem{
//   List<DropdownMenuItem<String>>? modelsItems = List<DropdownMenuItem<String>>.generate(models.length, (index) =>
//       DropdownMenuItem(
//         value: models[index],
//        // value: ChatGptController().data[index].id,
//         child: TextWidget(label: models[index], fontSize: 15,),),
//   );
//   print("Printing model Index ${models.toList()}");
//   return modelsItems;
// }

  //  final chatMessages =[
  //   {
  //     "msg":'Hello Who are you?',
  //     "chatIndex":0,
  //   },
  //   {
  //     "msg":'Hello, I am ChatGPT, ChatGPT is an artificial intelligence ChatBot developed by OpenAI and released in November 2022. It is built on top of OpenAI\'s GPT-3.5 and GPT-4 foundational large language models and has been fine-tuned using both supervised and reinforcement learning techniques',
  //     "chatIndex":1,
  //   },
  //   {
  //     "msg":'What is Flutter',
  //     "chatIndex":0,
  //   },
  //   {
  //     "msg":'Flutter is an open-source UI software development kit created by Google. It is used to develop cross-platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase. First described in 2015, Flutter was released in May 2017',
  //     "chatIndex":1,
  //   },
  //   {
  //     "msg":'Okay Thank you',
  //     "chatIndex":0,
  //   },
  //   {
  //     "msg":'You Welcome',
  //     "chatIndex":1,
  //   }
  //
  // ];


