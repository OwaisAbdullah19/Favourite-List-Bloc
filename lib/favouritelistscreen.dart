import 'package:flutter/material.dart';

class Favouritelistscreen extends StatefulWidget {
  const Favouritelistscreen({super.key});

  @override
  State<Favouritelistscreen> createState() => _FavouritelistscreenState();
}

class _FavouritelistscreenState extends State<Favouritelistscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Favourite List'),),
      ),
    );
  }
}