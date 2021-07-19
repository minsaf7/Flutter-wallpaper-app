import 'dart:convert';

import 'package:futtergallery/Data/data.dart';
import 'package:futtergallery/Models/WallpaperModel.dart';

import 'package:http/http.dart' as http;

class APICalls {
  List<WallpaperModel> wallpapers = [];
  getTrendingImages() async {
    var response = await http.get(
        Uri.parse("https://api.pexels.com/v1/curated?per_page=15&page=1"),
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
