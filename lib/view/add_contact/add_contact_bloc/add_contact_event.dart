part of 'add_contact_bloc.dart';

@immutable
sealed class AddContactEvent{}

final class FirstNameChanges extends AddContactEvent{
  FirstNameChanges(this.firstName);
  final String firstName;
}

final class SecondNameChanges extends AddContactEvent{
  SecondNameChanges(this.secondName);
  final String secondName;
}
final class PhoneChanges extends AddContactEvent{
  PhoneChanges(this.phoneNum);
  final int phoneNum;
}
final class UserEmail extends AddContactEvent{
  UserEmail(this.userEmail);
  final String userEmail;
}
final class NickNameChanges extends AddContactEvent{
  NickNameChanges(this.userNickName);
  final String userNickName;
}
final class UpdateFormSubmit extends AddContactEvent{}
final class FormSubmit extends AddContactEvent{}