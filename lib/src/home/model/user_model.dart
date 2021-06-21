// ///
// /// Copyright (C) 2020 Andrious Solutions
// ///
// /// This program is free software; you can redistribute it and/or
// /// modify it under the terms of the GNU General Public License
// /// as published by the Free Software Foundation; either version 3
// /// of the License, or any later version.
// ///
// /// You may obtain a copy of the License at
// ///
// ///  http://www.apache.org/licenses/LICENSE-2.0
// ///
// ///
// /// Unless required by applicable law or agreed to in writing, software
// /// distributed under the License is distributed on an "AS IS" BASIS,
// /// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// /// See the License for the specific language governing permissions and
// /// limitations under the License.
// ///
// ///          Created  17 Apr 2019
// ///
// ///
// /// Copyright (C) 2018 Andrious Solutions
// ///
// /// This program is free software; you can redistribute it and/or
// /// modify it under the terms of the GNU General Public License
// /// as published by the Free Software Foundation; either version 3
// /// of the License, or any later version.
// ///
// /// You may obtain a copy of the License at
// ///
// ///  http://www.apache.org/licenses/LICENSE-2.0
// ///
// ///
// /// Unless required by applicable law or agreed to in writing, software
// /// distributed under the License is distributed on an "AS IS" BASIS,
// /// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// /// See the License for the specific language governing permissions and
// /// limitations under the License.
// ///
// ///          Created  16 Dec 2018
// ///
// ///
// /// At a glance you can see what of the three MVC components are used here.
// /// In this case, it's View
// ///
// import 'package:mvc_template/src/view.dart';

// class User<E> implements Comparable<User> {
//   User();

//   User.fromMap(Map m) {
//     _username = m["username"];
//     _password = m["password"];
//     _token = m["token"];
//   }

//   String _username;
//   String _password;
//   String _token;

//   // return {_username;}

//   @override
//   int compareTo(User other) {
//     // TODO: implement compareTo
//     throw UnimplementedError();
//   }
// }

// class Username extends FieldWidgets<User> {
//   Username([User contact])
//       : super(object: contact, label: 'Username', value: contact?._username);

//   void onSaved(v) => object?._username = value = v;
// }

// class Password extends FieldWidgets<User> {
//   Password([User contact])
//       : super(object: contact, label: 'Password', value: contact?._password;

//   void onSaved(v) => object?._password = value = v;
// }

// class Token extends FieldWidgets<User> {
//   Token([User contact])
//       : super(object: contact, label: 'Token', value: contact?._token;

//   void onSaved(v) => object?._token = value = v;
// }