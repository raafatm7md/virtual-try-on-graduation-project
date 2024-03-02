import 'package:TryOn/core/resources/data_state.dart';

abstract class ResetPasswordRepo {
  Future<DataState> sendEmail();
  Future<DataState> sendOtp();
  Future<DataState> resetPassword();
}