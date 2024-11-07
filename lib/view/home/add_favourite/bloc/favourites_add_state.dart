part of 'favourites_add_bloc.dart';

enum FormStatus {
  inital,
  pending,
  success,
  error,
  failure
}

@immutable
final class FavouritesAddState {
  FavouritesAddState(
      {this.userEmail = '',
      this.firstName = '',
      this.secondName = '',
      this.id='',
      this.userPhone = 0,
      this.status = FormStatus.inital,
      this.errorMsg,
      this.nickName = ''});
  final String firstName;
  final String id;
  final String secondName;
  final int userPhone;
  final FormStatus status;
  final String userEmail;
  final String nickName;
  final String? errorMsg;

  FavouritesAddState copyWith({
    String? firstName,
    String? secondName,
    int? userPhone,
    String?id,
    FormStatus? status,
    String? userEmail,
    String? nickName,
    String? errorMsg,
  }) =>
      FavouritesAddState(
        id: id??this.id,
          firstName: firstName ?? this.firstName,
          secondName: secondName ?? this.secondName,
          userPhone: userPhone ?? this.userPhone,
          userEmail: userEmail ?? this.userEmail,
          nickName: nickName??this.nickName,
          status: status ?? this.status,
          errorMsg: errorMsg ?? this.errorMsg);
}
