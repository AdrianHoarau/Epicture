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
import 'package:provider/provider.dart';
import 'package:epicture_final/src/view.dart';
import 'package:epicture_final/src/controller.dart';
import 'package:epicture_final/src/imgur/imgur_tools.dart';
import 'package:epicture_final/src/imgur/constants.dart' as vars;

class UserPage extends StatelessWidget {

  void _chooseSort(BuildContext context)
{
  Widget okButton = FlatButton(
    child: Text("NEWEST"),
    onPressed: () {
      Navigator.pop(context);
      getFavorites(context, "newest").whenComplete(() {
        Navigator.of(context).pushNamed(('/favorites'));
      });
    },
  );

  Widget notOkButton = FlatButton(
    child: Text("OLDEST"),
    onPressed: () {
      Navigator.pop(context);
      getFavorites(context, "oldest").whenComplete(() {
        Navigator.of(context).pushNamed(('/favorites'));
      });
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Favorites sorting"),
    content: Text("Would you like to sort by newest or oldest ?"),
    actions: [
      okButton,
      notOkButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

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

    _str = exp2.stringMatch(exp1.stringMatch(src));
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

  Future getImages(BuildContext ctx) async
  {
    List<dynamic> list;
    String _str = "";
    vars.ImageType _img = new vars.ImageType();

    return ImgurTools.getImgurImages(0).then((value) {
      value.forEach((key, value) {
        if (key == 'data') {
          list = value;
          vars.Constants.img = [];
          list.forEach((element) { 
            _str = element.toString();
            _img.iId = getId(_str);
            _img.iLink = getLink(_str);
            _img.iName = getName(_str);
            _img.iDesc = null;
            vars.Constants.img.add(_img);
            _img = new vars.ImageType();
          });
        }
      });
    });
  }

  Future getFavorites(BuildContext ctx, String sort) async
  {
    List<dynamic> list;
    String _str = "";
    vars.ImageType _img = new vars.ImageType();

    return ImgurTools.getFavorites(0, sort).then((value) {
      value.forEach((key, value) {
        if (key == 'data') {
          list = value;
          vars.Constants.fav = [];
          list.forEach((element) {
            _str = element.toString();
            _img.iId = getId(_str);
            print(_img.iId);
            _img.iLink = "https://i.imgur.com/"+getCover(_str)+"."+getExtension(_str);
            _img.iName = getTitle(_str);
            _img.iDesc = null;
            vars.Constants.fav.add(_img);
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
        centerTitle: true,
        title: Text("Welcome ${vars.Constants.username}", textAlign: TextAlign.center,),
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
        crossAxisSpacing: 60,
        mainAxisSpacing: 120,
        crossAxisCount: 2,
        children: <Widget>[
        IconButton(
          iconSize: 100,
          icon: Icon(Icons.photo_album),
          color: Colors.blue,
          tooltip: 'Gallery',
          onPressed: () {
            getImages(context).whenComplete(() {
              Navigator.of(context).pushNamed(('/gallery'));
            });
          },
        ),
        IconButton(
          iconSize: 100,
          icon: Icon(Icons.favorite),
          color: Colors.blue,
          tooltip: 'Favorites',
          onPressed: () {
            _chooseSort(context);
          },
        ),
        IconButton(
          iconSize: 100,
          icon: Icon(Icons.search),
          color: Colors.blue,
          tooltip: 'Search',
          onPressed: () {
            // vars.Constants.isSearch = false;
            Navigator.of(context).pushNamed(('/search'));
          },
        ),
        IconButton(
          iconSize: 100,
          icon: Icon(Icons.file_upload),
          color: Colors.blue,
          tooltip: 'Upload',
          onPressed: () {
            Navigator.of(context).pushNamed(('/upload'));
          },
        ),
        ],
      ),
      ),
    );
  }
}