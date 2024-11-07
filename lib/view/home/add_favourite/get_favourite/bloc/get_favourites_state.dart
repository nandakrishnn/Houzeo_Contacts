part of 'get_favourites_bloc.dart';

sealed class GetFavouritesState extends Equatable {
  const GetFavouritesState();

  @override
  List<Object> get props => [];
}

final class GetUserContactsInitial extends GetFavouritesState {}

final class GetUserContactsLoading extends GetFavouritesState {}

final class GetUserContactsLoaded extends GetFavouritesState {
  List<DocumentSnapshot> data;
  GetUserContactsLoaded(this.data);
  @override
  List<Object> get props => [data];
}
final class GetUserContactsFailure extends GetFavouritesState {
  String errorMsg;
  GetUserContactsFailure(this.errorMsg);
  @override
  List<Object> get props => [errorMsg];
}