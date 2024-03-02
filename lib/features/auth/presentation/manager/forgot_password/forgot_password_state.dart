part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class SendOtpState extends ForgotPasswordState {}

class ResetPasswordState extends ForgotPasswordState {}

class SuccessState extends ForgotPasswordState {}
