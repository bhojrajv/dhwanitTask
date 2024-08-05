import 'package:dwanitask/Appconst/appcolors.dart';
import 'package:flutter/material.dart';

class DropDownButtonWidget extends StatefulWidget {
  final List<String>menu;
   String? selectvl;
  DropDownButtonWidget({required this.menu,this.selectvl,Key? key}) : super(key: key);

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButtonWidget> {
  @override
  Widget build(BuildContext context) {
      return DropdownButton<String>(underline: Container(height: 1,color: AppcColors.black.withOpacity(.4),),
          value: widget.selectvl,isExpanded: true,
        items: widget.menu.map<DropdownMenuItem<String>>((e){
          return DropdownMenuItem<String>(child: Text("${widget.selectvl}"),value: e,);
        }).toList(), onChanged:(v){
          setState(() {
            widget.selectvl=v??"";
          });
        });;
  }
}
