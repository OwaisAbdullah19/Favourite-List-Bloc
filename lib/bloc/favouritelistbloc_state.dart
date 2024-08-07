part of 'favouritelistbloc_bloc.dart';
 enum Liststatus {loading,success,faield}


class FavouritelistblocState extends Equatable {
  final List< FavouriteItem> favouriteItemlist ;
  final Liststatus liststatus;
  FavouritelistblocState({
     this.liststatus = Liststatus.loading,
    this.favouriteItemlist = const [],
  });
  FavouritelistblocState copyWith ({List<FavouriteItem>?favouriteitemlist,Liststatus?listStatus}){
  return FavouritelistblocState(
    liststatus: listStatus??this.liststatus,
favouriteItemlist: favouriteitemlist??this.favouriteItemlist,
  );
 }
  
  @override
  List<Object> get props => [favouriteItemlist,liststatus];
}


