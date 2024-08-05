import 'package:dwanitask/Appconst/appString.dart';
import 'package:dwanitask/data_model/model/getDistict.dart';
import 'package:dwanitask/data_model/source/user_remote_source_Impl.dart';
import 'package:dwanitask/util/sharePref/userPref.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisContorller extends GetxController{
  final UserRemoteSourceImpl remoSourceImpl;
  DisContorller({required this.remoSourceImpl});
  RxBool isDist=false.obs;
  RxList<String>dist_list=<String>[].obs;
  void addDistrict({String?dist}){
    if(!dist_list.contains(dist)){
      dist_list.value.add(dist??"");
      update();
    }
  }
  Rx<GetDistrict> getDistRes=GetDistrict().obs;
  Future<void>fetch_dist({String?token})async{
    isDist.value=true;
    getDistRes.value=await remoSourceImpl.getDist(token: token??"");
   // debugPrint("dist:${getDistRes.value.district?.first.districtName}");
    isDist.value=false;
    update();
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    fetch_dist(token:await UserPref.getToken(key: AppString.key_token) );
  }
}