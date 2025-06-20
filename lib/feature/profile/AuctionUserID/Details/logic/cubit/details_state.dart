part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsfavorateLoading extends DetailsState {}

final class DetailsfavorateSeccessfluy extends DetailsState {}

final class DetailsfavorateError extends DetailsState {}

final class DetailsRemovefavorateLoading extends DetailsState {}

final class DetailsRemovefavorateseccessfluy extends DetailsState {}

final class DetailsRemovefavorateError extends DetailsState {}
