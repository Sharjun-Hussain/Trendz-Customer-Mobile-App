import 'package:dio/dio.dart';
import 'package:trendz_customer/Models/service_modal.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "http://128.199.31.7",
    // baseUrl: "http://192.168.8.145",
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

  Future<List<Service>> fetchServices() async {
    try {
      final response = await _dio.get('/api/services');
      if (response.statusCode == 200) {
        List data = response.data as List;
        return data.map((json) => Service.fromJson(json)).toList();
      }
      throw Exception('Failed to fetch services');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
