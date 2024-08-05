import 'package:dwanitask/Appconst/appcolors.dart';
import 'package:dwanitask/util/initBinding.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String? label;
  final Callbackfun callbackfun;
  const CommonButton({this.label,required this.callbackfun,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      TextButton(onPressed: (){
        callbackfun();
    }, child: Text("$label",style: TextStyle(color: AppcColors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppcColors.green), minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width/1,45)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),);
  }
}
