import 'package:dwanitask/data_model/source/user_remort_source.dart';
import 'package:dwanitask/data_model/source/user_remote_source_Impl.dart';
import 'package:dwanitask/data_model/userResponse.dart';
import 'package:dwanitask/viewmodel/childCrontroller.dart';
import 'package:dwanitask/viewmodel/distric_controller.dart';
import 'package:dwanitask/viewmodel/state_controller.dart';
import 'package:dwanitask/viewmodel/user_logincontroller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class InitiBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UserLoginController(remoteSourceImpl: UserRemoteSourceImpl(remoteSource:
    UserRemoteSource(client: http.Client())),));
    Get.create(() => UserLoginController(remoteSourceImpl: UserRemoteSourceImpl(remoteSource:
    UserRemoteSource(client: http.Client())),));
   // Get.lazyPut(() =>Statecontroller() );
    Get.create(() =>Statecontroller(remoSourceImpl: UserRemoteSourceImpl(remoteSource:
    UserRemoteSource(client: http.Client()))) );
    Get.create(() =>DisContorller(remoSourceImpl: UserRemoteSourceImpl(remoteSource:
    UserRemoteSource(client: http.Client()))) );
    Get.create(() =>ChildController(remoSourceImpl: UserRemoteSourceImpl(remoteSource:
    UserRemoteSource(client: http.Client()))) );
  }

}
typedef Callbackfun=void Function();