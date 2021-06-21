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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:epicture_final/src/view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:epicture_final/src/controller.dart';
import 'package:path/path.dart';
import 'package:epicture_final/src/imgur/imgur_tools.dart';
import 'package:epicture_final/src/imgur/constants.dart' as vars;

Future<File> _imgFromGallery() async
{
    final image = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    final File file = File(image.path);
    return (file);
}

class UploadPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload", textAlign: TextAlign.center,),
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
      child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text('Choose an image to upload', textScaleFactor: 2,),
        IconButton(
          iconSize: 100,
          icon: Icon(Icons.photo_library_outlined),
          tooltip: 'Search',
          onPressed: () {
            _imgFromGallery().then((value) {
              ImgurTools.uploadImage(basename(value.path), "", value);
            });
          },
        ),
      ],
      ),
      ),
    );
  }
}