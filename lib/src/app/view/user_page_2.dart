import 'package:epicture_final/src/app/model/gallery_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:epicture_final/src/app/model/user_model.dart';
// import controller
import 'package:epicture_final/src/app/controller/user_controller.dart';

import 'package:epicture_final/src/app/controller/gallery_controller.dart';

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserController viewController = UserController();
    return ChangeNotifierProvider<UserModel>(
      create: (context) => UserModel.instance(),
      child: Consumer<UserModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
        title: Text("Welcome ${viewController.getter(context).getUsername()}", textAlign: TextAlign.center,),
        actions: <Widget>[
          FlatButton(textColor: Colors.white,
          onPressed: () {
            Navigator.popAndPushNamed((context), '/home');
          },
          child: Text("Logout"),
          shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
body: new Center(
      child: new GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
        IconButton(
          iconSize: 100,
          icon: Icon(Icons.photo_album),
          tooltip: 'Gallery',
          onPressed: () {
            // getImages(context);
            Navigator.of(context).pushNamed(('/gallery'));
          },
        ),
        IconButton(
          iconSize: 100,
          icon: Icon(Icons.tv),
          tooltip: 'Favorites',
          onPressed: () {
            // getFavorites(context);
            Navigator.of(context).pushNamed(('/favorites'));
          },
        ),
        IconButton(
          iconSize: 100,
          icon: Icon(Icons.search),
          tooltip: 'Search',
          onPressed: () {
            Navigator.of(context).pushNamed(('/search'));
          },
        ),
        IconButton(
          iconSize: 100,
          icon: Icon(Icons.plus_one_rounded),
          tooltip: 'Upload',
          onPressed: () {
            Navigator.of(context).pushNamed(('/upload'));
          },
        ),
        ],
      ),
      ),
          );
        },
      ),
    );
  }
}