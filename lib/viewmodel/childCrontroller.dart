import 'package:dwanitask/Appconst/appString.dart';
import 'package:dwanitask/data_model/model/getChild.dart';
import 'package:dwanitask/data_model/source/user_remote_source_Impl.dart';
import 'package:dwanitask/util/sharePref/userPref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildController extends GetxController{
  final UserRemoteSourceImpl remoSourceImpl;
  ChildController({required this.remoSourceImpl});
  RxBool isChild=false.obs;

  Rx<GetChildList>getchildRes=GetChildList().obs;
  Future<void>fetch_childList({String?token})async{
    isChild.value=true;
    getchildRes.value=await remoSourceImpl.getchildList(token: token??"");
    debugPrint("child:${getchildRes.value.childProfile?.first.name}");
    isChild.value=false;
    update();
  }
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    fetch_childList(token:await UserPref.getToken(key: AppString.key_token));
  }
}