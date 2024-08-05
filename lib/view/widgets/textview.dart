import 'package:dwanitask/Appconst/appcolors.dart';
import 'package:flutter/material.dart';

class CommonTextView extends StatelessWidget {
  final double?fonsize;
  final FontWeight? fontWeight;
  final Color?color;
  final String?text;
  const CommonTextView({this.text,this.fontWeight,this.color,this.fonsize,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("$text",style: TextStyle(fontSize: fonsize,fontWeight: fontWeight,color: color??AppcColors.txtgrey),);
  }
}
