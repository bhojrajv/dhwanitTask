import 'package:dwanitask/Appconst/appString.dart';
import 'package:dwanitask/data_model/UserLogin.dart';
import 'package:dwanitask/util/sharePref/userPref.dart';
import 'package:dwanitask/view/screens/surevey.dart';
import 'package:dwanitask/view/widgets/common_textfield.dart';
import 'package:dwanitask/view/widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dwanitask/Appconst/appcolors.dart';
import 'package:dwanitask/viewmodel/user_logincontroller.dart';


class Loginscreen extends GetView<UserLoginController> {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(leading: Icon(Icons.arrow_back_ios,color: AppcColors.textcolor,),backgroundColor: AppcColors.textcolor, elevation: 0),
      backgroundColor: AppcColors.white,
      body: Obx(
        ()=> SingleChildScrollView(
          child: Container(alignment: Alignment.center,padding: EdgeInsets.all(5.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [ Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center, children: [
                    LogoWidget(width: 120,height: 120,fontsize: 30,),
                     SizedBox(height: Get.height*.08,),
                  TextFieldForms(controller:controller.emaillogin,label: "Username",icons: Icon(Icons.email,color:Colors.grey ,)),
                  TextFieldForms(toggleEye:controller.isToggle.value , controller:controller.passlogin ,label: "Password",
                      icons: Icon(Icons.lock,color:Colors.grey ,),flag: "pass",sufix: InkWell(onTap: (){
                    controller.isTogglePass();
                  }, child:controller.isToggle.value?Image.asset("assets/eyeoff.png",scale: 10.0,):Icon(Icons.remove_red_eye_sharp))),
                 const SizedBox(height: 40,),
                controller.islogin.value==true?Center(child: CircularProgressIndicator(),) : TextButton(onPressed: ()async{
                   controller.userlogin(userLogin: UserLogin(username:controller.emaillogin.text, password:controller.passlogin.text))
                  .then((value){
                    UserPref.setToken(key: AppString.key_token,value:value?.nandghar?.tokenNandghar??"" );
                 if(value?.nandghar?.status==200){
                   debugPrint("token mang:${value?.nandghar?.tokenNandghar}");
                   Get.to(()=>SurveyPage(userResModel: value,));
                   Get.snackbar("message",value?.nandghar!.message??"" );
                 }
                  });

                 }, child: Text("Log In",style: TextStyle(color: AppcColors.white),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppcColors.green), minimumSize: MaterialStateProperty.all(Size(MediaQuery.of(context).size.width/1,45)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))),),
                  ],),
              ),
            )],),),
        ),
      ),);
  }
}
