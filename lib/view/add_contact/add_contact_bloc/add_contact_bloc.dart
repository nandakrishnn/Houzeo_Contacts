import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:houzeocontacts/services/contact_services.dart';
import 'package:random_string/random_string.dart';

part 'add_contact_event.dart';
part 'add_contact_state.dart';

class AddContactBloc extends Bloc<AddContactEvent, AddContactState> {
  final ContactServices contactService;
  AddContactBloc(this.contactService) : super(AddContactState()) {
   on<FirstNameChanges>(_firstNameChnages);
   on<SecondNameChanges>(_secondNameChnages);
   on<PhoneChanges>(_phoneChanges);
   on<UserEmail>(_emailChanges);
   on<NickNameChanges>(_nickNameChanges);
   on<FormSubmit>(_formSubmit);
  }

   void _firstNameChnages(FirstNameChanges event, Emitter<AddContactState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }
   void _secondNameChnages(SecondNameChanges event, Emitter<AddContactState> emit) {
    emit(state.copyWith(secondName: event.secondName));
  }
    void _phoneChanges(PhoneChanges event, Emitter<AddContactState> emit) {
    emit(state.copyWith(userPhone: event.phoneNum));
  }
    void _emailChanges(UserEmail event, Emitter<AddContactState> emit) {
    emit(state.copyWith(userEmail: event.userEmail));
  }
      void _nickNameChanges(NickNameChanges event, Emitter<AddContactState> emit) {
    emit(state.copyWith(nickName: event.userNickName));
  }
  void _formSubmit(FormSubmit event,Emitter<AddContactState>emit)async{
     emit(state.copyWith(status: FormStatus.pending));
        try {
          final mapId=randomAlphaNumeric(10);
          final contactInfo=contactService.userContact(id: mapId, firstName: state.firstName, secondName: state.secondName, userPhone: state.userPhone, email: state.userEmail, nickName: state.nickName);
          final added=contactService.addContactUser(contactInfo, mapId);
          if(added==true){
            emit(state.copyWith(status:FormStatus.success));
          }else{
              emit(state.copyWith(status:FormStatus.failure));
          }
        } catch (e) {
           emit(state.copyWith(status:FormStatus.failure));
          }
  }
}
