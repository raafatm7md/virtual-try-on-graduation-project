part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpFailure extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class GetImageSuccess extends SignUpState {}

final class GetImageError extends SignUpState {}
