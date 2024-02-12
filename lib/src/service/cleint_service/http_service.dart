import 'package:http/http.dart' as http;

class HttpService {
  final String baseUrl;

  HttpService({required this.baseUrl});

  Future<T> get<T>({
    required String apiPath,
    Map<String, String>? headers,
    required T Function(String body) convertor,
  }) async {
    try {
      Uri uri = Uri.parse(baseUrl + apiPath);
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return convertor(response.body);
      } else {
        throw Exception(
          "Error HttpService get function ${response.statusCode}",
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<T> post<T>({
    required String apiPath,
    Map<String, String>? headers,
    Object? body,
    required T Function(String body) convertor,
  }) async {
    try {
      Uri uri = Uri.parse(baseUrl + apiPath);
      final response = await http.post(uri, headers: headers, body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return convertor(response.body);
      } else {
        throw Exception(
          "Error HttpService get function ${response.statusCode}",
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
