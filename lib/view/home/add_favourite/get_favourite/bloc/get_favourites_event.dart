part of 'get_favourites_bloc.dart';

sealed class GetFavouritesEvent extends Equatable {
  const GetFavouritesEvent();

  @override
  List<Object> get props => [];
}
class FetchDataContact extends GetFavouritesEvent{

}
class FetchedDataContact extends GetFavouritesEvent{
List<DocumentSnapshot>data;
FetchedDataContact(this.data);
 @override
  List<Object> get props => [data];
}