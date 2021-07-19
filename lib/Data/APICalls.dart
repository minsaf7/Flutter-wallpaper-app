import 'dart:convert';

import 'package:futtergallery/Data/data.dart';
import 'package:futtergallery/Models/WallpaperModel.dart';

import 'package:http/http.dart' as http;

class APICalls {
  List<WallpaperModel> wallpapers = [];
  //get wallpapers
  getTrendingImages() async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=16&page=1"),
        headers: {"Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromJson(element);
      wallpapers.add(wallpaperModel);
      //print(wallpapers);
      return wallpapers;
    });
  }

  //search wallpapers
  getSearchImages(String query) async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?&query={$query}&per_page=16"),
        headers: {"Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromJson(element);
      wallpapers.add(wallpaperModel);
      //print(wallpapers);
      return wallpapers;
    });
  }

  //category
  getCategoryImages(String query) async {
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?&query={$query}&per_page=16"),
        headers: {"Authorization": apiKey});
    //print(response.body.toString());

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromJson(element);
      wallpapers.add(wallpaperModel);
      //print(wallpapers);
      return wallpapers;
    });
  }
}
