import 'package:http/http.dart' as http;

class CustomHttpClient {
  final http.Client _client;

  CustomHttpClient() : _client = http.Client();

  Future<http.Response> post(String url, {String? body}) {
    return _client.post(
      Uri.parse(url),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<http.Response> get(String url) {
    return _client.get(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<http.Response> put(String url, {String? body}) {
    return _client.put(
      Uri.parse(url),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<http.Response> delete(String url) {
    return _client.delete(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
