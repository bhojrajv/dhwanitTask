import 'package:dwanitask/data_model/model/getState.dart';

abstract class StateRepo{
  Future<Getstate>getState({required String token});
}