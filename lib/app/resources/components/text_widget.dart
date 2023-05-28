import 'package:blade/app/resources/colors/app_color.dart';
import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  final String label;
   double? fontSize;
   Color? color;
   FontWeight? fontWeight;

   TextWidget({Key? key,  this.fontSize,  this.color,  this.fontWeight, required this.label}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: color ?? AppColor.white, fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: fontSize),
    );
  }
}
