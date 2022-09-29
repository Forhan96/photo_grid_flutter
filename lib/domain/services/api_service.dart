import 'package:http/http.dart' as http;

abstract class ApiService {
  ///Fetch Photos from API
  Future<http.Response> fetchImages();
}
