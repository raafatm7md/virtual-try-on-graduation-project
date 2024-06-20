part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileGetDataError extends ProfileState {}

final class ProfileGetDataSuccess extends ProfileState {}
