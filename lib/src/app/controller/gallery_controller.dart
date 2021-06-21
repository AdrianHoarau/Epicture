import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:epicture_final/src/app/model/gallery_model.dart';
import 'package:epicture_final/src/imgur/imgur_tools.dart';

class GalleryController {
  
  GalleryController();
  
  List<ImageModel> getter(BuildContext context) {
    GalleryModel viewModel = Provider.of<GalleryModel>(context, listen: false);
    //Add code here for getter
    return (viewModel.getImages());
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

  void setter(BuildContext context) {
    
    GalleryModel viewModel = Provider.of<GalleryModel>(context, listen: false);
    List<dynamic> list;
    String _str = "";

    ImgurTools.getImgurImages(0).then((value) {
      value.forEach((key, value) {
        if (key == 'data') {
          list = value;
          list.forEach((element) { 
            _str = element.toString();
            viewModel.setImage(getName(_str), null, getLink(_str), getId(_str));
          });
        }
      });
    });
  }

  // void update(BuildContext context) {
  //   GalleryModel viewModel = Provider.of<GalleryModel>(context, listen: false);
  //   //TODO Add code here for update
  //   viewModel.update();
  // }

  void remove(BuildContext context) {
    GalleryModel viewModel = Provider.of<GalleryModel>(context, listen: false);
    //TODO Add code here for remove
    viewModel.clearImages();
  }
}