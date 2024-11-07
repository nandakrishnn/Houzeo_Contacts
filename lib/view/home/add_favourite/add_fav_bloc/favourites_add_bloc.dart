import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:houzeocontacts/services/contact_services.dart';
import 'package:random_string/random_string.dart';

part 'favourites_add_event.dart';
part 'favourites_add_state.dart';

class FavouritesAddBloc extends Bloc<FavouritesAddEvent, FavouritesAddState> {
  final ContactServices contactService;

  FavouritesAddBloc(this.contactService) : super(FavouritesAddState()) {
    on<FirstNameChanges>(_firstNameChnages);
    on<SecondNameChanges>(_secondNameChnages);
    on<PhoneChanges>(_phoneChanges);
    on<UserEmail>(_emailChanges);
    on<NickNameChanges>(_nickNameChanges);
    on<IdChanges>(_idChanges);
    on<FavUnsave>(_unsaveItem);
    on<FormSubmit>(_formSubmit);
    
 
  }

  void _firstNameChnages(
      FirstNameChanges event, Emitter<FavouritesAddState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  void _secondNameChnages(
      SecondNameChanges event, Emitter<FavouritesAddState> emit) {
    emit(state.copyWith(secondName: event.secondName));
  }

  void _phoneChanges(PhoneChanges event, Emitter<FavouritesAddState> emit) {
    emit(state.copyWith(userPhone: event.phoneNum));
  }
  void _idChanges(IdChanges event, Emitter<FavouritesAddState> emit) {
    emit(state.copyWith(id: event.id));
  }
  void _emailChanges(UserEmail event, Emitter<FavouritesAddState> emit) {
    emit(state.copyWith(userEmail: event.userEmail));
  }

  void _nickNameChanges(NickNameChanges event, Emitter<FavouritesAddState> emit) {
    emit(state.copyWith(nickName: event.userNickName));
  }

  void _formSubmit(FormSubmit event, Emitter<FavouritesAddState> emit) async {
    emit(state.copyWith(status: FormStatus.pending));
    try {
  
      final contactInfo = contactService.userContact(
          id: state.id,
          firstName: state.firstName,
          secondName: state.secondName,
          userPhone: state.userPhone,
          email: state.userEmail,
          nickName: state.nickName);
      final added = contactService.addContactFav(contactInfo, state.id);
      if (added == true) {
        emit(state.copyWith(status: FormStatus.success));
      } else {
        emit(state.copyWith(status: FormStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(status: FormStatus.failure));
    }
  }
   void _unsaveItem(
      FavUnsave event, Emitter<FavouritesAddState> emit) async {
    try {
      final added = await contactService.removeUserSaved(event.id);
      if (added == true) {
        print('Deleted');
      }
    } catch (e) {
      print("Not deleted");
    }
  }

}
