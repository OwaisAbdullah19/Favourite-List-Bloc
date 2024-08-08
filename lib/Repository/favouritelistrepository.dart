

import 'package:favouritelistbloc/models/favouriteitemmodel.dart';

class Favouritelistrepository {
 
 Future<List<FavouriteItem>> fetchlist()async{
    await Future.delayed(Duration(seconds: 3));
    return List.generate(10, (generator) =>FavouriteItem(id: generator.toString(), value: ('Item ${generator + 1}')));

 }
}
 
 
 




