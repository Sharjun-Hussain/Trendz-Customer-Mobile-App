import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "http://128.199.31.7",
    headers: {"Content-Type": "application/json"},
  ));

  Future<Map<String, dynamic>> loginWithEmailPassword(
      String email, String password) async {
    try {
      final response = await _dio.post('/api/admin/login', data: {
        "email": email,
        "password": password,
      });
      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw e.response?.data["message"] ?? "Login failed";
      }
      throw "An unexpected error occurred";
    }
  }

  Future<Map<String, dynamic>> oauthLogin(String provider, String token) async {
    try {
      final response = await _dio.post('/oauth-login', data: {
        "provider": provider,
        "token": token,
      });
      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw e.response?.data["message"] ?? "OAuth login failed";
      }
      throw "An unexpected error occurred";
    }
  }
}
