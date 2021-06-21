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
import 'package:epicture_final/src/imgur/host.dart';
import 'package:epicture_final/src/view.dart';
import 'package:epicture_final/src/imgur/constants.dart' as vars;

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Welcome to the Epicture"),
      ),
      body: Center (
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Stack(
            // children: <Widget>[
            // Image.asset("assets/images/back.jpg", fit: BoxFit.contain),
            ButtonTheme(
              minWidth: 200.0,
              height: 65.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/auth');
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
                  child:
                      const Text('Login', style: TextStyle(fontSize: 20)),
                ),
              ),
            )
            // ]
            // )
          ],
        ),
      ),
    );
  }
}
