part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileGetDataError extends ProfileState {}

final class ProfileGetDataSuccess extends ProfileState {}

final class EditProfileLoading extends ProfileState {}

final class EditProfileSuccess extends ProfileState {}

final class EditProfileError extends ProfileState {}
