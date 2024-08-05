

import 'dart:developer';

import 'package:dwanitask/data_model/UserLogin.dart';
import 'package:dwanitask/data_model/source/user_remote_source_Impl.dart';
import 'package:dwanitask/data_model/userResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserLoginController extends GetxController{
  RxBool islogin=false.obs;
 RxBool isToggle=false.obs;
 final UserRemoteSourceImpl remoteSourceImpl;
  UserLoginController({required this.remoteSourceImpl});
 final TextEditingController emaillogin=TextEditingController();
 final TextEditingController passlogin=TextEditingController();
   UserResModel userResModel=UserResModel();
   String logout_res="";
  Future<UserResModel?> userlogin({
    required UserLogin userLogin
  }) async {
    try {
      log("login");
      islogin(true);
      userResModel = await remoteSourceImpl.postUsers( userLogin: userLogin);
     /* userResModel=UserResModel(nandghar:  Nandghar(status: userResModel.nandghar?.status,message:userResModel.nandghar?.message ));*/
      update();

      return userResModel;
    } catch (e) {
      islogin(false);
      update();
      return userResModel;
    }
  }
  void isTogglePass(){
    isToggle.value=!isToggle.value;
    update();
  }
  String get logres =>logout_res;
  void set setLogres(String?res){
    logout_res=res??'';
    update();
  }

  Future<void>userLogout({required String token})async{
    try{
     var mesg=await remoteSourceImpl.user_logout(token: token);
    // debugPrint("mesg:${mesg}");
     setLogres=mesg;
     islogin(false);
    }catch(ex){
      islogin(false);
    }
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emaillogin.dispose();
    passlogin.dispose();
  }
}