import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPref{
  UserPref._internal();
  static final UserPref _instance=UserPref._internal();
  factory UserPref(){
    return _instance;
  }
 static Future<SharedPreferences>getPrefinstance()async{
    final SharedPreferences pref_instance= await SharedPreferences.getInstance();
    return pref_instance;
  }
 static Future<bool>setToken({String?key,String?value})async{
    debugPrint("token===>>${value}/${key}");
    var pref=await getPrefinstance();
    return  await pref.setString(key??"", value??"");
  }
static  Future<String?>getToken({String?key})async{
    var pref=await getPrefinstance();
    return await pref.getString(key??"");
  }
}