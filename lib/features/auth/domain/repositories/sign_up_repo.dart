import 'package:TryOn/core/resources/data_state.dart';

abstract class SignUpRepo {
  Future<DataState> signup();
}