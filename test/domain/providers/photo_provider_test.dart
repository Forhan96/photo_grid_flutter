import 'package:flutter_test/flutter_test.dart';
import 'package:photo_grid_flutter/data/api_service_impl.dart';
import 'package:photo_grid_flutter/domain/providers/photo_provider.dart';
import 'package:photo_grid_flutter/domain/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('Fetch Photos from Api test', () async {
    final ApiService apiService = ApiServiceImpl();
    final PhotoProvider photoProvider = PhotoProvider(sharedPreferences: await SharedPreferences.getInstance(), apiService: apiService);

    photoProvider.photos.clear();
    expect(photoProvider.photos.length, 0);

    await photoProvider.fetchPhotosFromApi();
    photoProvider.notifyListeners();
    expect(photoProvider.photos.isNotEmpty, true);
  });
}
