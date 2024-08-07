import 'package:equatable/equatable.dart';

class FavouriteItem extends Equatable{
 final String id;
 final  String value;
final bool isdeleting;
 final bool isfavourite;
FavouriteItem({
  required this.id,
  required this.value,
  this.isfavourite =false,
  this.isdeleting =false,
  });
  FavouriteItem copyWith({String?id,String?value,bool?isdeleting,bool?isfavourite}){

      return FavouriteItem(
        id: id??this.id, 
        value: value??this.value,
        isfavourite: isfavourite??this.isfavourite,
        isdeleting: isdeleting??this.isdeleting);
    }
  @override
  // TODO: implement props
  List<Object?> get props => [id,value,isdeleting,isfavourite];



}