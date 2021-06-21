// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:epicture_final/src/view.dart';
import 'package:epicture_final/src/controller.dart';
import 'package:epicture_final/src/imgur/imgur_tools.dart';
import 'package:epicture_final/src/imgur/constants.dart' as vars;

void _onPhotoClicked(int index, BuildContext context)
{
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      ImgurTools.favoriteAnImage(vars.Constants.img[index].iId);
      Navigator.pop(context);
    },
  );

    Widget notOkButton = FlatButton(
    child: Text("NO"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("You liked this picture !"),
    content: Text("Would you like to add to favorite ?"),
    actions: [
      okButton,
      notOkButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

List<Widget> _getPhotos(List<vars.ImageType> iconList, BuildContext ctx) {
  final List<Widget> tiles = <Widget>[];
  // if (vars.Constants.isGal == true) {
    for (int i = 0; i < iconList.length; i++) {
      tiles.add(new GridTile(
          child: new InkResponse(
        enableFeedback: true,
        child: new Image.network(iconList[i].iLink, fit: BoxFit.cover,),
        onTap: () => _onPhotoClicked(i, ctx),
      )));
    }
    return tiles;
  // }
  // return (tiles);
}

class GalleryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery", textAlign: TextAlign.center,),
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
        physics: ScrollPhysics(),
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: _getPhotos(vars.Constants.img, context),
      ),
    ),
    );
  }
}