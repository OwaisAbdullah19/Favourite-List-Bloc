import 'package:favouritelistbloc/Repository/favouritelistrepository.dart';
import 'package:favouritelistbloc/bloc/favouritelistbloc_bloc.dart';
import 'package:favouritelistbloc/favouritelistscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouritelistblocBloc(Favouritelistrepository()),
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: Favouritelistscreen(),
      ),
    );
  }
}
