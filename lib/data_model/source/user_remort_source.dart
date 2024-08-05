

import 'dart:convert';

import 'package:dwanitask/Appconst/appString.dart';
import 'package:dwanitask/data_model/UserLogin.dart';
import 'package:http/http.dart' as http;

class UserRemoteSource{
  final http.Client client;
  UserRemoteSource({required this.client});

  Future<dynamic>postUseronRemot({required UserLogin users})async{
   final url=Uri.parse(AppString.baseUrl+AppString.end_point);
   final response=await client.post(url,body: users.toJosn());
   var jsonResponse;
   if(response.statusCode==200){
     jsonResponse=jsonDecode(response.body);
     return jsonResponse;
   }else{
     return "Something went wrong";
   }
  }

  Future<String>userLogout({String?token})async{
    final url=Uri.parse(AppString.baseUrl+AppString.logout);
    final response=await client.get(url,headers: {"token":"${token}"});
    var jsonResponse;
    if(response.statusCode==200){
      jsonResponse=jsonDecode(response.body);
      return jsonResponse['message'];
    }else{
      return "Something went wrong";
    }
  }
  Future<dynamic>fetchState({String?token})async{
    final url=Uri.parse(AppString.baseUrl+AppString.getstate);
    final response=await client.get(url,headers: {"token":"${token}"});
    var jsonResponse;
   try{
     if(response.statusCode==200){
      jsonResponse=jsonDecode(response.body);
      return jsonResponse;
     }else{
       jsonResponse=jsonDecode(response.body);
       return jsonResponse;
     }
   }catch(ex){
     return ex.toString();
   }
  }
  Future<dynamic>fetchDist({String?token})async{
    final url=Uri.parse(AppString.baseUrl+AppString.get_dist);
    final response=await client.get(url,headers: {"token":"${token}"});
    var jsonResponse;
    try{
      if(response.statusCode==200){
        jsonResponse=jsonDecode(response.body);
        return jsonResponse;
      }else{
        jsonResponse=jsonDecode(response.body);
        return jsonResponse;
      }
    }catch(ex){
      return ex.toString();
    }
  }
  Future<dynamic>fetchChild({String?token})async{
    final url=Uri.parse(AppString.baseUrl+AppString.getchild);
    final response=await client.get(url,headers: {"token":"${token}"});
    var jsonResponse;
    try{
      if(response.statusCode==200){
        jsonResponse=jsonDecode(response.body);
        return jsonResponse;
      }else{
        jsonResponse=jsonDecode(response.body);
        return jsonResponse;
      }
    }catch(ex){
      return ex.toString();
    }
  }
}