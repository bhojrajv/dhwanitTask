import 'package:dwanitask/Appconst/appcolors.dart';
import 'package:dwanitask/util/initBinding.dart';
import 'package:flutter/material.dart';

class CommonBox extends StatelessWidget {
  final Icon icon;
  final String?label;
  final Callbackfun callback;
  const CommonBox({required this.callback,this.label,required this.icon,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        callback();
      },
      child: Card(shadowColor: AppcColors.logocolor,
        shape: RoundedRectangleBorder(side: BorderSide(width: 1,color: AppcColors.logocolor.withOpacity(.4))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
            child: Column(children: [icon,const SizedBox(height: 10,),Text("$label",style: TextStyle(color: AppcColors.logocolor),)],),
          )),
    );
  }
}

