import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:photo_grid_flutter/domain/models/photo.dart';
import 'package:photo_grid_flutter/domain/services/api_service.dart';
import 'package:photo_grid_flutter/utils/debugger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhotoProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;
  final ApiService apiService;

  PhotoProvider({required this.apiService, required this.sharedPreferences});

  final List<Photo> _photos = [];

  ///Get list of Photos
  List<Photo> get photos => _photos;

  /// Fetch photos from SharedPrefs
  ///
  /// If required fetch from API
  Future<void> fetchPhotos() async {
    String? lastFetched = sharedPreferences.getString("lastFetched");
    DateTime lastFetchedData;
    int difference = 1;
    if (lastFetched != null) {
      lastFetchedData = DateTime.parse(lastFetched);
      difference = DateTime.now().difference(lastFetchedData).inDays;
    }

    //If last fetched is equal of more than one day, fetch photos from API
    if (difference >= 1) {
      fetchPhotosFromApi();
      return;
    }
    List photoResponse = jsonDecode(sharedPreferences.getString("response") ?? "");
    for (var element in photoResponse) {
      _photos.add(Photo.fromJson(element));
      notifyListeners();
    }
  }

  ///Fetch photos from API
  Future<void> fetchPhotosFromApi() async {
    try {
      var response = await apiService.fetchImages();
      if (response.statusCode == 200) {
        List photoResponse = jsonDecode(response.body);
        sharedPreferences.setString("response", response.body);
        sharedPreferences.setString("lastFetched", DateTime.now().toString());
        _photos.clear();
        for (var element in photoResponse) {
          _photos.add(Photo.fromJson(element));
          notifyListeners();
        }
        Debugger.debug(tittle: "FetchPhotosFromApi: response-body", data: response.body);
      }
    } catch (e) {
      Debugger.debug(tittle: "FetchPhotosFromApi: catch-error", data: e);
    }
  }
}
