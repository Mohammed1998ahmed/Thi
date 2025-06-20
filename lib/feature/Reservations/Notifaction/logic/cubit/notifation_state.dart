part of 'notifation_cubit.dart';

@immutable
sealed class NotifationState {}

final class NotifationInitial extends NotifationState {}

final class NotifationLoadingN extends NotifationState {}

final class NotifationSecessfulyN extends NotifationState {}

final class NotifationError extends NotifationState {}

final class NotifationLoadingT extends NotifationState {}

final class NotifationSecessfulyT extends NotifationState {}

final class NotifationErrorT extends NotifationState {}
