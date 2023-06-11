import 'package:blade/app/resources/colors/app_color.dart';
import 'package:blade/app/resources/components/text_widget.dart';
import 'package:blade/app/view_model/controllers/chatgtp_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalDropDownList extends StatefulWidget {
  const ModalDropDownList({Key? key}) : super(key: key);

  @override
  State<ModalDropDownList> createState() => _ModalDropDownListState();
}

class _ModalDropDownListState extends State<ModalDropDownList> {

  ChatGptController controller = Get.put(ChatGptController());
  List<DropdownMenuItem<String>> dropdownItems = [];

  @override
  void initState() {
    super.initState();
    //controller.defaulModulId.value.toString();
    controller.getModelList();
    //controller.data.value.toString();
    dropdownItems = List.generate(
      controller.data.value.length,
          (index) => DropdownMenuItem(
        value: controller.data.value[index].id,
        child: TextWidget(label: controller.data.value[index].id.toString()
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=> FittedBox(
        child: DropdownButton<String>(
          iconEnabledColor: AppColor.white,
          dropdownColor: AppColor.scaffoldBackground,
          value: controller.defaultModuleId.value.toString(),
          items: dropdownItems,
          onChanged: (value) {
            //selectedModule = value.toString();
            setState(() {
              controller.defaultModuleId.value = value.toString();
            });
          },),
      ),
    );
  }
}
