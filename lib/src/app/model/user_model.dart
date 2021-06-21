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

enum UserModelStatus {
  Ended,
  Loading,
  Error,
}

class UserModel extends ChangeNotifier
{
  UserModelStatus _status;
  String _errorCode;
  String _errorMessage;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  UserModelStatus get status => _status;

  UserModel();

  UserModel.instance() {
    // TODO yes
  }

  String _accessToken;
  String _refreshToken;
  String _username;
  String _userId;
  int _expiration;

  void setAccessToken(String newToken) {
      _accessToken = newToken;
  }

  void setRefreshToken(String newToken) {
      _refreshToken = newToken;
  }

  void setUsername(String newUsername) {
      _username = newUsername;
  }

  void setUserID(String newId) {
      _userId = newId;
  }

  void setExpiration(int newExpiration) {
      _expiration = newExpiration;
  }

  String getAccessToken() {
      return (_accessToken);
  }

  String getRefreshToken() {
      return (_refreshToken);
  }

  String getUsername() {
      return (_username);
  }

  String getUserId() {
      return (_userId);
  }

  int getExpiration() {
      return (_expiration);
  }

  UserModel getter()
  {
    return (this);
  }

  void setter(String accessToken, String refreshToken, String username, String userId, int expiration)
  {
    setAccessToken(accessToken);
    setRefreshToken(refreshToken);
    setUsername(username);
    setUserID(userId);
    setExpiration(expiration);
  }

  void clear()
  {
    _accessToken = "";
    _refreshToken = "";
    _username = "";
    _userId = "";
    _expiration = 0;
  }
}