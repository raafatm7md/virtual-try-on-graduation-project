import 'package:TryOn/core/resources/data_state.dart';

abstract class LoginRepo {
  Future<DataState> login();
}
