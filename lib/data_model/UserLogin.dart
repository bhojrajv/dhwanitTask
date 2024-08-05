import 'package:dwanitask/domain/entities/Users.dart';

class UserLogin extends Users{
  UserLogin({required String username,required String password}):super(password,username);
  Map<String,dynamic>toJosn(){
    return {"username":username,"password":password};
  }
}