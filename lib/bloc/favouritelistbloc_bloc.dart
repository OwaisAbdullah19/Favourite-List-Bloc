import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favouritelistbloc/Repository/favouritelistrepository.dart';
import 'package:favouritelistbloc/models/favouriteitemmodel.dart';

part 'favouritelistbloc_event.dart';
part 'favouritelistbloc_state.dart';

class FavouritelistblocBloc extends Bloc<FavouritelistblocEvent, FavouritelistblocState> {

  Favouritelistrepository favoutiterepository;
      List <FavouriteItem> favouriteitemlist = [];



  FavouritelistblocBloc(this.favoutiterepository) : super(FavouritelistblocState()) {
    on<favouritelistfetch>((event, emit) async{
       favouriteitemlist = await favoutiterepository.fetchlist();
       emit(state.copyWith(favouriteitemlist: List.from(favouriteitemlist),listStatus: Liststatus.success));
    });

    on<favouriteobject>((event, emit) {
     final index = favouriteitemlist.indexWhere((test) => test.id == event.updateitem.id );
      favouriteitemlist[index] = event.updateitem;
       emit(state.copyWith(favouriteitemlist: List.from(favouriteitemlist),listStatus: Liststatus.success));
    });
  }
}
 