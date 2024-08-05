import 'package:flutter/material.dart';
import 'package:dwanitask/Appconst/appcolors.dart';
import 'package:get/get.dart';

class TextFieldForms extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final Widget? icons;
 final String?flag;
 final Widget? sufix;
 final bool?toggleEye;
  const TextFieldForms({this.toggleEye=true,required this.controller,this.flag,this.label,this.icons,this.sufix,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,
      children: [
        //Text("$label",style: TextStyle(color: AppcColors.textcolor.withOpacity(.04),fontWeight: FontWeight.bold),),
        TextFormField(  scrollPadding:EdgeInsets.zero ,maxLines: 1,minLines: 1,
          obscureText:flag=="pass"? toggleEye??false:false, controller: controller,decoration: InputDecoration(label: Text("$label"),hintText: '$label',enabled: true,
        ),),
      ],
    );
  }
}
