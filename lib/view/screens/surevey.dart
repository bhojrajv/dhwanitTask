import 'package:dwanitask/Appconst/appString.dart';
import 'package:dwanitask/Appconst/appcolors.dart';
import 'package:dwanitask/data_model/userResponse.dart';
import 'package:dwanitask/util/sharePref/userPref.dart';
import 'package:dwanitask/view/auth/login_screen.dart';
import 'package:dwanitask/view/screens/children.dart';
import 'package:dwanitask/view/screens/district.dart';
import 'package:dwanitask/view/screens/state.dart';
import 'package:dwanitask/view/widgets/commonButtong.dart';
import 'package:dwanitask/view/widgets/comon_box.dart';
import 'package:dwanitask/view/widgets/logo_widget.dart';
import 'package:dwanitask/view/widgets/textview.dart';
import 'package:dwanitask/viewmodel/user_logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurveyPage extends GetView<UserLoginController> {
  final UserResModel? userResModel;
  const SurveyPage({this.userResModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: (){
              Get.defaultDialog(content: Text("Do you want logout?")
              ,confirm: CommonButton(callbackfun: ()async{
                await controller.userLogout(token:await UserPref.getToken(key: AppString.key_token)??"");
                controller.islogin(false);
                Get.offUntil(MaterialPageRoute(builder: (context)=>Loginscreen()), (route) => false);
                  },label: "Logout",));
            },
            child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.power_settings_new),
                    ),
          )],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LogoWidget(height: 35,width: 45,fontsize: 10,color: AppcColors.white,),
        ),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(children: [Row(children: [CommonTextView(color: AppcColors.black,text: "Name:",
          fonsize: 16,fontWeight: FontWeight.w500,), SizedBox(width: Get.width*.04,),CommonTextView(color: AppcColors.greycolor,text: "${controller.userResModel?.ifmr?.locations?.first.name}",
            fonsize: 16,fontWeight: FontWeight.w500,)],),
                 const SizedBox(height: 10,),
            Row(children: [CommonTextView(color: AppcColors.black,text: "organization:",
              fonsize: 16,fontWeight: FontWeight.w500,), SizedBox(width: Get.width*.04,),CommonTextView(color: AppcColors.greycolor,text: "${controller.userResModel?.ifmr?.locations?[1].name}",
              fonsize: 16,fontWeight: FontWeight.w500,)],),
            const SizedBox(height: 10,),
            Row(children: [CommonTextView(color: AppcColors.black,text: "designation:",
              fonsize: 16,fontWeight: FontWeight.w500,), SizedBox(width: Get.width*.04,),CommonTextView(color: AppcColors.greycolor,text: "${controller.userResModel?.ifmr?.locations?[2].name}",
              fonsize: 16,fontWeight: FontWeight.w500,)],),
            const SizedBox(height: 10,),
            Image.asset("assets/child.jpeg",fit: BoxFit.cover,width: Get.width,),
            const SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [CommonBox(callback: (){Get.to(()=>StatePage());},
                  icon: Icon(Icons.other_houses_outlined,size: 70,color: AppcColors.logocolor.withOpacity(.8),), label: "STATE"),
                CommonBox(callback: (){
                  Get.to(()=>DistrictPage());
                },
                    icon: Icon(Icons.houseboat,size: 70,color: AppcColors.logocolor.withOpacity(.8),), label: "DISTRICT"),
                CommonBox(callback: (){
                  Get.to(()=>ChildrenPage());
                },
                    icon: Icon(Icons.child_care,size: 70,color: AppcColors.logocolor.withOpacity(.8),), label: "CHILD")],)
          ],),
        ),
      ),
    );
  }
}
