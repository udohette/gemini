import 'package:flutter/material.dart';

import '../../resources/colors/app_color.dart';
import '../../resources/components/modal_drop_down_list.dart';
import '../../resources/components/text_widget.dart';

class Services{

  static Future<void> showModalSheet(BuildContext context)async{
    await showModalBottomSheet(
        backgroundColor: AppColor.scaffoldBackground,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: TextWidget(fontSize: 16, label: "Chosen Model"),
            ),
            Flexible(
              flex: 2,
                child: ModalDropDownList())
          ],
        ),
      );
    });
  }

}