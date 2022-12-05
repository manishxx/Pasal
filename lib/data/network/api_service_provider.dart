import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pasal/app/constants/app_constants.dart';
import 'package:pasal/models/api_products.dart';
import 'package:pasal/models/products.dart';

import '../local/shared_preferences/shared_preference_manager.dart';

class ApiServiceProvider {
  final SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();
  String? accesstoken;
  void _printError(error, StackTrace stacktrace) {
    debugPrint('error: $error & stacktrace: $stacktrace');
  }

  Future<List<Products>?> getProduct() async {
    try {
      accesstoken = sharedPreferencesManager.getAccessToken()!;
      final response = await http.get(
        Uri.parse('${baseUrl}products'),
        headers: <String, String>{'token': 'Bearer $accesstoken'},
      );
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        log("jsonResponse ${jsonResponse[0]}");
        return jsonResponse.map((data) => Products.fromJson(data)).toList();
      } else {
        log('Failed to get products.');
        return null;
      }
    } catch (e, stacktrace) {
      _printError(e, stacktrace);
    }
    log('Failed to get products.');
    return null;
  }
}
