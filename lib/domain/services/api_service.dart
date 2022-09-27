import 'package:photo_grid_flutter/domain/models/api_response.dart';

abstract class ApiService {
  Future<ApiResponse> fetchImages();
}
