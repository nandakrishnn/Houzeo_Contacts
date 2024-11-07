import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:houzeocontacts/services/contact_services.dart';

part 'get_contact_info_event.dart';
part 'get_contact_info_state.dart';

class GetContactInfoBloc
    extends Bloc<GetContactInfoEvent, GetContactInfoState> {
  final ContactServices contactServices;
  GetContactInfoBloc(this.contactServices) : super(GetUserContactsInitial()) {
    on<FetchDataContact>(_fetchData);
    on<FetchedDataContact>(_dataFetched);
  }
  Future _fetchData(
      FetchDataContact event, Emitter<GetContactInfoState> emit) async {
    emit(GetUserContactsLoading());
    try {
      Stream<QuerySnapshot> catgeoryStream = (contactServices
          .getUserContactDetails());
      catgeoryStream.listen((snapshots) {
        final data = snapshots.docs;
        add(FetchedDataContact(data));
      });
    } catch (e) {
      emit(GetUserContactsFailure(e.toString()));
    }
  }

  void _dataFetched(
      FetchedDataContact event, Emitter<GetContactInfoState> emit) {
    emit(GetUserContactsLoaded(event.data));
  }
}
