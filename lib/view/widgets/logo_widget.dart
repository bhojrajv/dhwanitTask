import 'package:dwanitask/Appconst/appcolors.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double width;
  final double height;
  final double fontsize;
  final Color? color;
  const LogoWidget({this.color,required this.height,required this.width,required this.fontsize,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text("LOGO",style: TextStyle(fontSize: fontsize,fontWeight: FontWeight.bold, color: AppcColors.logocolor),),
      width: width,height: height,decoration: BoxDecoration(color: color??AppcColors.white,
          border: Border.all(color: AppcColors.logocolor,width: 2.5,  ),borderRadius: BorderRadius.circular(80.0)),);
  }
}
