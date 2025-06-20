part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSusccfuly extends LoginState {}

final class LoginError extends LoginState {}

final class LoginChangLoading extends LoginState {}

final class LoginChangObsiervice extends LoginState {}
final class NotifationLoadingN extends LoginState {}
final class NotifationSecessfulyN extends LoginState {}
final class NotifationError extends LoginState {}


final class NotifationLoadingT extends LoginState {}
final class NotifationSecessfulyT extends LoginState {}
final class NotifationErrorT extends LoginState {}