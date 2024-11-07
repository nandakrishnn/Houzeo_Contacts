part of 'favourites_add_bloc.dart';

@immutable
sealed class FavouritesAddEvent{}

final class FirstNameChanges extends FavouritesAddEvent{
  FirstNameChanges(this.firstName);
  final String firstName;
}

final class SecondNameChanges extends FavouritesAddEvent{
  SecondNameChanges(this.secondName);
  final String secondName;
}
final class PhoneChanges extends FavouritesAddEvent{
  PhoneChanges(this.phoneNum);
  final int phoneNum;
}
final class UserEmail extends FavouritesAddEvent{
  UserEmail(this.userEmail);
  final String userEmail;
}
final class NickNameChanges extends FavouritesAddEvent{
  NickNameChanges(this.userNickName);
  final String userNickName;
}

final class IdChanges extends FavouritesAddEvent{
  IdChanges(this.id);
  final String id;
}
final class FavUnsave extends FavouritesAddEvent{
  final String id; 
 
    FavUnsave(this.id);
}
class ClearForm extends FavouritesAddEvent {}
final class UpdateFormSubmit extends FavouritesAddEvent{}
final class FormSubmit extends FavouritesAddEvent{}