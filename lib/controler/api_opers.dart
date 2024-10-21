import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper/model/catmodel.dart';
import 'package:wallpaper/views/screens/search_screen.dart';
// import 'package:wallpaper/model/categoryModel.dart';
// import 'package:wallpaper/model/photosModel.dart';

import 'dart:math';

import 'package:wallpaper/model/photo_model.dart';

class ApiOperations {
  static List<PhotosModel> trendingWallpapers = [];
  static List<PhotosModel> searchWallpapersList = [];
  static List<CategoryModel> cateogryModelList = [];

  static String _apiKey =
      "o0QRcSaghQfvDw7HPRxdDcFKtX06CTYlsx291ZeHowXh28HX5VVCMNec";
  static Future<List<PhotosModel>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"),
        headers: {"Authorization": "$_apiKey"}).then((value) {
      print("RESPONSE REPORT");
      print(value.body);
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        trendingWallpapers.add(PhotosModel.fromAPItoApp(element));
      });
    });

    return trendingWallpapers;
  }

  static Future<List<PhotosModel>> searchWallpapers(String query) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {"Authorization": "$_apiKey"}).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      searchWallpapersList.clear();
      photos.forEach((element) {
        searchWallpapersList.add(PhotosModel.fromAPItoApp(element));
      });
    });

    return searchWallpapersList;
  }

  static List<CategoryModel> getCategoriesList() {
    List cateogryName = [
      "Cars",
      "Nature",
      "Bikes",
      "Street",
      "City",
      "Flowers"
    ];
    cateogryModelList.clear();
    cateogryName.forEach((catName) async {
      final _random = new Random();

      PhotosModel photoModel =
          (await searchWallpapers(catName))[0 + _random.nextInt(11 - 0)];
      print("IMG SRC IS HERE");
      print(photoModel.imagsrc);
      cateogryModelList
          .add(CategoryModel(catImgUrl: photoModel.imagsrc, catName: catName));
    });

    return cateogryModelList;
  }
}
