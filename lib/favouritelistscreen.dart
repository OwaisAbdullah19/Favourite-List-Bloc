import 'package:favouritelistbloc/bloc/favouritelistbloc_bloc.dart';
import 'package:favouritelistbloc/models/favouriteitemmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favouritelistscreen extends StatefulWidget {
  const Favouritelistscreen({super.key});

  @override
  State<Favouritelistscreen> createState() => _FavouritelistscreenState();
}

class _FavouritelistscreenState extends State<Favouritelistscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouritelistblocBloc>().add(favouritelistfetch());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            context.read<FavouritelistblocBloc>().add(delete());
          }, icon: Icon(Icons.delete)),
        ],
        title: Center(child: Text('Favourite List'),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavouritelistblocBloc, FavouritelistblocState>(
          builder: (context, state) {

            switch(state.liststatus){

              case Liststatus.loading:
              return Center(child: CircularProgressIndicator());
               case Liststatus.faield:
               return Center(child: Text('Failed'));
              case Liststatus.success:
                return ListView.builder(
                  itemCount: state.favouriteItemlist.length,
                  itemBuilder: (context,index){
                    final item = state.favouriteItemlist[index];
                  return Card(
                    
                    child: ListTile(
                      leading: Checkbox(value: state.favouriteItemlist[index].isdeleting, onChanged: (value) {
                      FavouriteItem updateitem1 = FavouriteItem(id:  state.favouriteItemlist[index].id, value: item.value, 
                     isfavourite: item.isfavourite ? true : false,  //in place of item we can use (state.favouriteitemlist[index])
                      isdeleting: item.isdeleting ? false : true);
                       context.read<FavouritelistblocBloc>().add(favouriteobject(updateitem: updateitem1));

                       }),
                   title: Text(item.value.toString()),
                      trailing: IconButton(onPressed: (){
                 FavouriteItem updateitem = FavouriteItem(id:  state.favouriteItemlist[index].id, value: item.value,  //in place of item we can use (state.favouriteitemlist[index])
                 isfavourite: item.isfavourite ? false : true,
                 isdeleting: item.isdeleting?true:false
                 );
                 context.read<FavouritelistblocBloc>().add(favouriteobject(updateitem: updateitem));

                        
                      }, icon: Icon(item.isfavourite ? Icons.favorite : Icons.favorite_outline)
                    )
                    )
                  );
                
                  }
                );
                
            }
          }
      )
    )
  );
  }
}