import 'package:epicture_final/src/view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:epicture_final/src/app/model/gallery_model.dart';
// import controller
import 'package:epicture_final/src/app/controller/gallery_controller.dart';
import 'dart:async';

class GalleryView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    GalleryController viewController = GalleryController();
    return ChangeNotifierProvider<GalleryModel>(
      create: (context) => GalleryModel(),
      child: Consumer<GalleryModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
          appBar: AppBar(
            title: Text("Gallery", textAlign: TextAlign.center,),
            actions: <Widget>[
            FlatButton(textColor: Colors.white,
              onPressed: () {
              viewController.getter(context);
              // Navigator.pushNamed((context), '/home');
            },
            child: Text("Logout"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            ],
          ),
        body: new Center(
        child: new GridView.count(
        physics: ScrollPhysics(),
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
        // FlatButton(
        // child: Text("Button"),
        // onPressed: () => print('pressed'),
        // ).onPressed(),
          for (var i in viewController.getter(context)) Image.network(i.getLink(), width: 300,height: 300,),
          // new Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: <Widget>[
          //     // viewController.setter(context),
          //   //   IconButton(
          //   //     iconSize: 100,
          //   //     icon: Icon(Icons.photo_library_outlined),
          //   //     tooltip: 'Search',
          //   //     onPressed: () => print('HELLO'),
          //   //  ),
          //   ],
          // ),
        ],
      ),
    ),
          );
        },
      ),
    );
  }
}