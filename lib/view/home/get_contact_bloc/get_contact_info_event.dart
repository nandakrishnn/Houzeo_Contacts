part of 'get_contact_info_bloc.dart';

sealed class GetContactInfoEvent extends Equatable {
  const GetContactInfoEvent();

  @override
  List<Object> get props => [];
}
class FetchDataContact extends GetContactInfoEvent{

}
class FetchedDataContact extends GetContactInfoEvent{
List<DocumentSnapshot>data;
FetchedDataContact(this.data);
 @override
  List<Object> get props => [data];
}