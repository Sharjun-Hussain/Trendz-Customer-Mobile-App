import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:trendz_customer/Services/api_services.dart';

class AuthService {
  final ApiService _apiService = ApiService();

  Future<Map<String, dynamic>> loginWithEmailPassword(
      String email, String password) async {
    return await _apiService.loginWithEmailPassword(email, password);
  }

  Future<Map<String, dynamic>> loginWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) throw "Google login canceled";

      final googleAuth = await googleUser.authentication;
      final response =
          await _apiService.oauthLogin("google", googleAuth.accessToken!);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Map<String, dynamic>> loginWithFacebook() async {
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final response = await _apiService.oauthLogin(
            "facebook", result.accessToken!.tokenString);
        return response;
      }
      throw "Facebook login failed";
    } catch (e) {
      throw e.toString();
    }
  }
}
