part of 'favouritelistbloc_bloc.dart';

class FavouritelistblocEvent extends Equatable {
   FavouritelistblocEvent();

  @override
  List<Object> get props => [];
}
class favouritelistfetch extends FavouritelistblocEvent{}


class favouriteobject extends FavouritelistblocEvent{
 final  FavouriteItem updateitem;
 favouriteobject({required this.updateitem});

 @override
  List<Object> get props => [updateitem];

  void add(FavouriteItem updateitem) {}
}


class delete extends FavouritelistblocEvent{}