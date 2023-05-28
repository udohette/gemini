
import 'package:blade/app/resources/colors/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/services/constant.dart';

class ModalDropDownList extends StatefulWidget {
  const ModalDropDownList({Key? key}) : super(key: key);

  @override
  State<ModalDropDownList> createState() => _ModalDropDownListState();
}

class _ModalDropDownListState extends State<ModalDropDownList> {

  String currentModel = models[0];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      iconEnabledColor: AppColor.white,
      dropdownColor: AppColor.scaffoldBackground,
      value: currentModel,
        items: getModelsItem,
        onChanged: (value) {
         setState(() {
           currentModel = value.toString();
         });
        },);
  }
}
