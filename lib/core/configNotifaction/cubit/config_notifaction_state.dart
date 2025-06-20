part of 'config_notifaction_cubit.dart';

@immutable
sealed class ConfigNotifactionState {}

final class ConfigNotifactionInitial extends ConfigNotifactionState {}
final class ConfigNotifactionTokenLoading extends ConfigNotifactionState {}
final class ConfigNotifactionTokenSessecfluy extends ConfigNotifactionState {}
final class ConfigNotifactionTokenError extends ConfigNotifactionState {}
