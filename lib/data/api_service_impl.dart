import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:photo_grid_flutter/data/common/api_constants.dart';
import 'package:photo_grid_flutter/data/common/api_status_message.dart';
import 'package:photo_grid_flutter/domain/models/api_response.dart';
import 'package:photo_grid_flutter/domain/services/api_service.dart';

class ApiServiceImpl implements ApiService {
  @override
  Future<ApiResponse> fetchImages() async {
    Uri url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.PHOTOS);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return ApiResponse(status: response.statusCode, message: ApiStatusMessage.SUCCESS, result: jsonResponse);
    } else {
      return ApiResponse(status: response.statusCode, message: ApiStatusMessage.FAILED, result: jsonDecode(response.body));
    }
  }
}
