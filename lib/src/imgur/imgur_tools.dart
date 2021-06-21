import 'package:epicture_final/src/imgur/constants.dart' as vars;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class ImgurTools {
    
    static const String baseUrl = "https://api.imgur.com/3/";

    static Future<Map<String, dynamic>> getImgurImages(int nbPage) async {
        var getImagesUrl = baseUrl + "account/" + vars.Constants.username + "/images/" + nbPage.toString();
        var res = await http.get(Uri.encodeFull(getImagesUrl), headers: {"Authorization": "Bearer " + vars.Constants.accessToken});
        Map<String, dynamic> data = await json.decode(res.body) as Map<String, dynamic>;
        return (data);
    }

    static Future<Map<String, dynamic>> searchImage(String image, int nbPage) async {
        var searchUrl = baseUrl + "gallery/search/time/all/" + nbPage.toString() + "?q=" + image;
        var res = await http.get(Uri.encodeFull(searchUrl), headers: {"Authorization": "Bearer " + vars.Constants.accessToken});
        Map<String, dynamic> data = await json.decode(res.body) as Map<String, dynamic>;
        return (data);
    }

  static uploadImage(String title, String description, File toUpload) async
  {
    var uploadUrl = baseUrl + "image";
 
    List<int> bytes = toUpload.readAsBytesSync();
    String img64 = base64Encode(bytes);
 
    var response = await http.post(
      uploadUrl,
      headers: {"Authorization": "Bearer " + vars.Constants.accessToken},
      body: {
          "title": title,
          "description": description,
          "image": img64,
      }
    );
    print(response.body);
  }

  static favoriteAnImage(String imageHash) async {
      var favoriteUrl = baseUrl + "image/" + imageHash + "/favorite";
      var res = await http.post(favoriteUrl, headers: {"Authorization": "Bearer " + vars.Constants.accessToken});
      print(res.body);
  }

  static Future<Map<String, dynamic>> getFavorites(int nbPage, String sort) async {
      var favoriteUrl = baseUrl + "account/" + vars.Constants.username + "/favorites/" + nbPage.toString() + "/" + sort;
      var res = await http.get(favoriteUrl, headers: {"Authorization": "Bearer " + vars.Constants.accessToken});
      Map<String, dynamic> data = await json.decode(res.body) as Map<String, dynamic>;
      return (data);
  }
}