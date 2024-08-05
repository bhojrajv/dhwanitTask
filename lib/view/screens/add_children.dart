import 'package:dwanitask/Appconst/appcolors.dart';
import 'package:dwanitask/view/screens/camera_page.dart';
import 'package:dwanitask/view/widgets/commonButtong.dart';
import 'package:dwanitask/view/widgets/common_textfield.dart';
import 'package:dwanitask/view/widgets/dropdown_button.dart';
import 'package:dwanitask/view/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddChildrenPage extends StatefulWidget {
  const AddChildrenPage({Key? key}) : super(key: key);

  @override
  State<AddChildrenPage> createState() => _AddChildrenPageState();
}

class _AddChildrenPageState extends State<AddChildrenPage> {
  final TextEditingController _controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [Padding(
        padding: const EdgeInsets.only(right: 20.0,bottom: 5,top: 5),
        child: LogoWidget(height: 25, width: 50, fontsize: 10),
      )],
        title: Text("Add Children"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(child: Column(children: [
          TextFieldForms(controller: _controller,label: "Name",),
          const SizedBox(height: 10,),
          DropDownButtonWidget(menu: ["Sex","Male","Female"],selectvl: "Sex"),
          TextFieldForms(controller: _controller,label: "Date Of Birth Day",),
          TextFieldForms(controller: _controller,label: "Father's Name",),
          TextFieldForms(controller: _controller,label: "Mother's Name",),
          const SizedBox(height: 15,),
          DropDownButtonWidget(menu: ["State","State2","State2"],selectvl: "State"),
          const SizedBox(height: 10,),
          DropDownButtonWidget(menu: ["District","District2","District3"],selectvl: "District"),
          const SizedBox(height: 20,),
          InkWell(
            onTap: (){
              Get.to(()=>CameraExampleHome());
            },
            child: Container(alignment: Alignment.center,
              width: Get.height/2,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: AppcColors.logocolor,width: 1.5)),
            child: Text("Take a photo / Upload",style: TextStyle(color: AppcColors.logocolor,fontSize: 15),),),
          ),
          const SizedBox(height: 20,),
          CommonButton(callbackfun: (){},label: "Submit",)
        ],)),
      ),
    );
  }
}
