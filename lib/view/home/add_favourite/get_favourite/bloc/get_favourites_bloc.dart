import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:houzeocontacts/services/contact_services.dart';

part 'get_favourites_event.dart';
part 'get_favourites_state.dart';

class GetFavouritesBloc extends Bloc<GetFavouritesEvent, GetFavouritesState> {
     final ContactServices contactServices;
  GetFavouritesBloc(this.contactServices) : super(GetUserContactsInitial()) {
    on<FetchDataContact>(_fetchData);
    on<FetchedDataContact>(_dataFetched);
  }
  Future _fetchData(
      FetchDataContact event, Emitter<GetFavouritesState> emit) async {
    emit(GetUserContactsLoading());
    try {
      Stream<QuerySnapshot> catgeoryStream = (contactServices
          .getUserContactFavDetails());
      catgeoryStream.listen((snapshots) {
        final data = snapshots.docs;
        add(FetchedDataContact(data));
      });
    } catch (e) {
      emit(GetUserContactsFailure(e.toString()));
    }
  }

  void _dataFetched(
      FetchedDataContact event, Emitter<GetFavouritesState> emit) {
    emit(GetUserContactsLoaded(event.data));
  }
  }

