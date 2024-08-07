

import 'package:favouritelistbloc/bloc/favouritelistbloc_bloc.dart';

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
                      title: Text(item.value.toString()),
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