import 'dart:io';
import 'dart:convert' as env;
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trendz_customer/Models/customer_location_modal.dart';
import 'package:trendz_customer/Models/service_modal.dart';
import 'package:trendz_customer/Models/shop_details_modal.dart';
import 'package:trendz_customer/Pages/App/Home_page.dart';

const securestorage = FlutterSecureStorage();

class ApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: "http://206.189.143.91",
    // baseUrl: "http://192.168.8.145",
    headers: {"Content-Type": "application/json"},
  ));

  Future<Map<String, dynamic>> loginWithEmailPassword(
      String email, String password) async {
    try {
      final response = await _dio.post('/api/customer/login', data: {
        "email": email,
        "password": password,
      });
      print(response.data['data']);
      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw e.response?.data["message"] ?? "Login failed";
      }
      throw "An unexpected error occurred";
    }
  }

  Future<Map<String, dynamic>> RegisterWithEmailPassword(
      String email,
      int? location_id,
      String name,
      String phone_number,
      String gender,
      String password) async {
    try {
      final response = await _dio.post('/api/customer/register', data: {
        "email": email,
        "password": password,
        "location_id": location_id ?? 1,
        "name": name,
        "gender": gender,
        "phone_number": phone_number
      });
      return response.data;
    } catch (e) {
      if (e is DioException) {
        throw e.response?.data["message"] ?? "Login failed";
      }
      throw "An unexpected error occurred";
    }
  }

  Future<List<Services>> fetchServices(int saloon_id) async {
    try {
      final token = await securestorage.read(key: "token");
      final response = await _dio.get(
        '/api/customer/service/$saloon_id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        var data = response.data['data'] as List;
        return data.map((service) => Services.fromJson(service)).toList();
        // print(response.data['data']);
      } else {
        throw Exception(
            'Internal Server Error. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<ShopDetails> fetchshopDetails(int shop_id) async {
    try {
      final token = await securestorage.read(key: "token");
      final response = await _dio.get(
        '/api/customer/shop/$shop_id',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return ShopDetails.fromJson(response.data is String
                ? env.jsonDecode(response.data) // Decode if it's a String
                : response.data['data'] // Use directly if it's already a Map
            );
      } else {
        throw Exception(
            'Internal Server Error. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<CustomerLocation> fetchlocation() async {
    try {
      final response = await _dio.get(
        '/api/customer/get-location',
      );

      if (response.statusCode == 200) {
        // print(response.data['data']);
        return CustomerLocation.fromJson(response.data);
      } else {
        throw Exception(
            'Internal Server Error. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
