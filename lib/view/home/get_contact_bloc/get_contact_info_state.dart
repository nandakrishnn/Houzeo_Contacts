part of 'get_contact_info_bloc.dart';

sealed class GetContactInfoState extends Equatable {
  const GetContactInfoState();

  @override
  List<Object> get props => [];
}

final class GetUserContactsInitial extends GetContactInfoState {}

final class GetUserContactsLoading extends GetContactInfoState {}

final class GetUserContactsLoaded extends GetContactInfoState {
  List<DocumentSnapshot> data;
  GetUserContactsLoaded(this.data);
  @override
  List<Object> get props => [data];
}
final class GetUserContactsFailure extends GetContactInfoState {
  String errorMsg;
  GetUserContactsFailure(this.errorMsg);
  @override
  List<Object> get props => [errorMsg];
}