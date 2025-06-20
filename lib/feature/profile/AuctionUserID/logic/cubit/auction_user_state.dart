part of 'auction_user_cubit.dart';

@immutable
sealed class AuctionUserState {}

final class AuctionUserInitial extends AuctionUserState {}

final class AuctionUserLoading extends AuctionUserState {}

final class AuctionUserSeccessfluy extends AuctionUserState {}

final class AuctionUserError extends AuctionUserState {}
final class AuctionUserWinLoading extends AuctionUserState {}

final class AuctionUserWinSeccessfluy extends AuctionUserState {}

final class AuctionUserWinError extends AuctionUserState {}