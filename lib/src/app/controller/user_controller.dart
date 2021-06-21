import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:epicture_final/src/app/model/user_model.dart';
import 'package:epicture_final/src/app/controller/gallery_controller.dart';
import 'package:epicture_final/src/imgur/imgur_tools.dart';

class UserController {
  
  UserController();
  
  UserModel getter(BuildContext context) {
    UserModel viewModel = Provider.of<UserModel>(context, listen: false);
    // Provider.of(context)<UserModel>(context, listen: false);
    //Add code here for getter
    return (viewModel.getter());
  }

  void setter(BuildContext context, String accessToken, String refreshToken, String username, String userId, int expiration) {
    
    UserModel viewModel = Provider.of<UserModel>(context, listen: false);
    viewModel.setter(accessToken, refreshToken, username, userId, expiration);
  }

  // void update(BuildContext context) {
  //   UserModel viewModel = Provider.of<UserModel>(context, listen: false);
  //   //TODO Add code here for update
  //   viewModel.update();
  // }

  void remove(BuildContext context) {
    UserModel viewModel = Provider.of<UserModel>(context, listen: false);
    viewModel.clear();
  }
}