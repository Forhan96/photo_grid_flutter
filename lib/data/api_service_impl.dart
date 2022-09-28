import 'package:http/http.dart' as http;
import 'package:photo_grid_flutter/data/common/api_constants.dart';
import 'package:photo_grid_flutter/domain/services/api_service.dart';

class ApiServiceImpl implements ApiService {
  @override
  Future<http.Response> fetchImages() async {
    Uri url = Uri.parse(ApiConstants.BASE_URL + ApiConstants.PHOTOS);
    return await http.get(url);
  }
}
