import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pasal/app/constants/app_constants.dart';
import 'package:pasal/data/local/shared_preferences/shared_preference_manager.dart';
import 'package:pasal/presentation/sign_in/sign_in_controller/sign_in_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/token.dart';

class ApiAuthProvider {
  void _printError(error, StackTrace stacktrace) {
    debugPrint('error: $error & stacktrace: $stacktrace');
  }

  Future<Token?> login(Map map) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(map),
      );
      if (response.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool("isLoggedIn", true);
        log("stay logged in value = $preferences");
        log("logged in ${response.body}");

        return Token.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to login');
      }
    } catch (e, stacktrace) {
      _printError(e, stacktrace);
    }
    return null;
  }

  Future<Token?> register(Map map) async {
    try {
      final response = await http.post(
        Uri.parse('${baseUrl}auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(map),
      );
      if (response.statusCode == 201) {
        log("registered in ${response.body}");
        return Token.fromJson(jsonDecode(response.body));
      } else {
        log("registered in ${response.statusCode}");

        throw Exception('Failed to register');
      }
    } catch (e, stacktrace) {
      _printError(e, stacktrace);
    }
    return null;
  }
}
