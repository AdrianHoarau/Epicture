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

import 'package:epicture_final/src/imgur/imgur_tools.dart';
import 'package:flutter/material.dart';
import 'package:epicture_final/src/view.dart';
import 'package:epicture_final/src/controller.dart';
import 'package:epicture_final/src/imgur/constants.dart' as vars;

void _onPhotoClicked(int index, BuildContext context)
{
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      print(vars.Constants.search[index].iId);
      ImgurTools.favoriteAnImage(vars.Constants.search[index].iId);
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
  if (vars.Constants.isSearch == true) {
    for (int i = 0; i < iconList.length; i++) {
      tiles.add(new GridTile(
          child: new InkResponse(
        enableFeedback: true,
        child: new Image.network(iconList[i].iLink, width: 300, height: 300),
        onTap: () => _onPhotoClicked(i, ctx),
      )));
    }
    return tiles;
  }
  return (tiles);
}

class SearchPage extends StatelessWidget {

  String getLink(String src)
  {
    RegExp exp1 = new RegExp(r'link:(.\S*)');
    RegExp exp2 = new RegExp(r'\s(.*)');
    String _str = "";

    _str = exp2.stringMatch(exp1.stringMatch(src));
    _str = _str.substring(1, (_str.length-1));
    return(_str);
  }

  String getId(String src)
  {
    RegExp exp1 = new RegExp(r'id:(.\S*)');
    RegExp exp2 = new RegExp(r'\s(.*)');
    String _str = "";

    _str = exp2.stringMatch(exp1.stringMatch(src));
    _str = _str.substring(1, (_str.length-1));
    return(_str);
  }

  String getName(String src)
  {
    RegExp exp1 = new RegExp(r'name:(.\S*)');
    RegExp exp2 = new RegExp(r'\s(.*)');
    String _str = "";

    _str = exp2.stringMatch(exp1.stringMatch(src));
    _str = _str.substring(1, (_str.length-1));
    return(_str);
  }

  String getCover(String src)
  {
    RegExp exp1 = new RegExp(r'cover:(.\S*)');
    RegExp exp2 = new RegExp(r'\s(.*)');
    String _str = "";

    _str = exp1.stringMatch(src);
    if (_str == null)
      return ("");
    _str = exp2.stringMatch(_str);
    _str = _str.substring(1, (_str.length-1));
    return(_str);
  }

  String getExtension(String src)
  {
    RegExp exp1 = new RegExp(r'type:(.\S*)');
    RegExp exp2 = new RegExp(r'\s(.*)');
    RegExp exp3 = new RegExp(r'\/(.\S*)');
    String _str = "";

    _str = exp2.stringMatch(exp1.stringMatch(src));
    if (_str == "")
      return ("");
    _str = _str.substring(1, (_str.length-1));
    _str = exp3.stringMatch(_str);
    _str = _str.substring(1, _str.length);
    return(_str);
  }

  String getTitle(String src)
  {
    RegExp exp1 = new RegExp(r'title:(.\S*)');
    RegExp exp2 = new RegExp(r'\s(.*)');
    String _str = "";

    _str = exp2.stringMatch(exp1.stringMatch(src));
    _str = _str.substring(1, (_str.length-1));
    return(_str);
  }

  Future getSearch(BuildContext ctx, String search) async
  {
    List<dynamic> list;
    String _str = "";
    vars.ImageType _img = new vars.ImageType();

    return ImgurTools.searchImage(search, 0).then((value) {
      value.forEach((key, value) {
        if (key == 'data') {
          list = value;
          vars.Constants.search = [];
          list.forEach((element) {
            _str = element.toString();
            if (getCover(_str) != "")
              _img.iLink = "https://i.imgur.com/"+getCover(_str)+".jpg";
            else
              _img.iLink = getLink(_str);
            _img.iId = getCover(_str);
            _img.iName = getTitle(_str);
            _img.iDesc = null;
            vars.Constants.search.add(_img);
            _img = new vars.ImageType();
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search", textAlign: TextAlign.center,),
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
        child: Column(
          children: <Widget>[
            if (vars.Constants.isSearch == true)
              Expanded(
                child: SizedBox(
                  height: 200.0,
                  child: new GridView.count(physics: ScrollPhysics(), primary: false, padding: const EdgeInsets.all(20), crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2,
                    children: _getPhotos(vars.Constants.search, context)
                  ),
                )
              )
            else
              new TextField(controller: TextEditingController(), onSubmitted: (String value) { getSearch(context, value).whenComplete(() { vars.Constants.isSearch = true; Navigator.popAndPushNamed(context, '/search');});}),
          ],
        ),
      )
    );
  }
}