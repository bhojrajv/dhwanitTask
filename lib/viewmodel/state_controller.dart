import 'package:dwanitask/Appconst/appString.dart';
import 'package:dwanitask/data_model/source/user_remote_source_Impl.dart';
import 'package:dwanitask/util/sharePref/userPref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data_model/model/getState.dart';

class Statecontroller extends GetxController{
  final UserRemoteSourceImpl remoSourceImpl;
  Statecontroller({required this.remoSourceImpl});
  RxList<String>state_list=<String>[].obs;
  RxString _token="".obs;
  RxBool isState=false.obs;
  void addState({String?state}){
    if(!state_list.contains(state)){
      state_list.value.add(state??"");
      update();
    }
  }
  RxString selectstate="".obs;
  Rx<Getstate>getStateRes=Getstate().obs;
  Future<void>fetch_state({String?token})async{
    isState.value=true;
    getStateRes.value=await remoSourceImpl.getState(token: token??"");
    debugPrint("state:${getStateRes.value.state?.first.stateName}");
    selectstate.value=getStateRes.value.state?.first?.stateName??"";
    isState.value=false;
    update();
  }
  void set setToken(String?token){
    _token.value=token??"";
    update();
  }
  String get getToken=>_token.value;
  Future<void> fetchToken()async{
   var token= await UserPref.getToken(key: AppString.key_token);
   setToken=token;
   update();
  }

  @override
  void onInit()async{
    // TODO: implement onInit
    super.onInit();
    fetchToken();
    fetch_state(token: await UserPref.getToken(key: AppString.key_token));
  }
}