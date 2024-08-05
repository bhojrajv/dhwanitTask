import 'package:dwanitask/data_model/UserLogin.dart';
import 'package:dwanitask/data_model/model/getChild.dart';
import 'package:dwanitask/data_model/model/getDistict.dart';
import 'package:dwanitask/data_model/model/getState.dart';
import 'package:dwanitask/data_model/userResponse.dart';

abstract class UserRepo{
  Future<UserResModel> postUsers({required UserLogin userLogin});
  Future<String> user_logout({required String token});
  Future<Getstate>getState({required String token});
  Future<GetDistrict>getDist({required String token});
  Future<GetChildList>getchildList({required String token});
}