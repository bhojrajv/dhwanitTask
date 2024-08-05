import 'package:dwanitask/data_model/UserLogin.dart';
import 'package:dwanitask/data_model/model/getChild.dart';
import 'package:dwanitask/data_model/model/getDistict.dart';
import 'package:dwanitask/data_model/model/getState.dart';
import 'package:dwanitask/data_model/source/user_remort_source.dart';
import 'package:dwanitask/data_model/userResponse.dart';
import 'package:dwanitask/domain/repository/userRepo.dart';

class UserRemoteSourceImpl extends UserRepo {
  final UserRemoteSource remoteSource;
  UserRemoteSourceImpl({required this.remoteSource});

  @override
  Future<UserResModel> postUsers({UserLogin? userLogin}) async{
     var userRes=await remoteSource.postUseronRemot(users: userLogin!);
    return UserResModel.fromJson(userRes);
  }

  @override
  Future<String> user_logout({required String token}) async{
    // TODO: implement user_logout
    return await remoteSource.userLogout(token: token);
  }

  @override
  Future<Getstate> getState({required String token})async {
    // TODO: implement getState
    return Getstate.fromJson(await remoteSource.fetchState(token: token));
  }

  @override
  Future<GetDistrict> getDist({required String token}) async{
    // TODO: implement getDist
    return await GetDistrict.fromJson(await remoteSource.fetchDist(token: token));
  }

  @override
  Future<GetChildList> getchildList({required String token}) async{
    // TODO: implement getchildList
    return await GetChildList.fromJson(await remoteSource.fetchChild(token: token));
  }

}