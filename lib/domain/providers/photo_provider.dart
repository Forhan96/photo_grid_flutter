import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:photo_grid_flutter/di_container.dart';
import 'package:photo_grid_flutter/domain/models/photo.dart';
import 'package:photo_grid_flutter/domain/services/api_service.dart';

class PhotoProvider extends ChangeNotifier {
  final ApiService _apiService = sl<ApiService>();

  final List<Photo> _photos = [];

  List<Photo> get photos => _photos;

  Future<void> fetchPhotos() async {
    var response = await _apiService.fetchImages();
    if (response.statusCode == 200) {
      List photoResponse = jsonDecode(response.body);
      for (var element in photoResponse) {
        _photos.add(Photo.fromJson(element));
        notifyListeners();
      }
      print(_photos);
    } else {
      print("---------------------------");
    }
  }
}
