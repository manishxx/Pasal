import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pasal/app/constants/app_constants.dart';
import 'package:pasal/models/api_products.dart';
import 'package:pasal/models/cart.dart';
import 'package:pasal/models/orders.dart';

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

  Future<bool> addToCart(Map map) async {
    log("map $map");
    try {
      accesstoken = sharedPreferencesManager.getAccessToken()!;

      final response = await http.post(
        Uri.parse('${baseUrl}cart'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': 'Bearer $accesstoken'
        },
        body: jsonEncode(map),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        log('Failed to addToCart().');
        return false;
      }
    } catch (e, stacktrace) {
      _printError(e, stacktrace);
    }
    log('Failed to add to CART.');
    return false;
  }

  Future<Cart?> getCart() async {
    try {
      accesstoken = sharedPreferencesManager.getAccessToken()!;

      final response = await http.get(
        Uri.parse('${baseUrl}cart/find/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': 'Bearer $accesstoken'
        },
      );
      if (response.statusCode == 200) {
        return Cart.fromJson(jsonDecode(response.body));
      } else {
        log('Failed to getCart().');
        return null;
      }
    } catch (e, stacktrace) {
      _printError(e, stacktrace);
    }
    log('Failed to add to CART.');
    return null;
  }

  Future<Cart?> removeCart(String id) async {
    try {
      accesstoken = sharedPreferencesManager.getAccessToken()!;
      log("token $accesstoken");
      final response = await http.delete(
        Uri.parse('${baseUrl}cart?itemId=$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': 'Bearer $accesstoken',
        },
      );
      if (response.statusCode == 200) {
        log('Deletion Success');
      } else {
        log('Failed to delete from Carttttttt.');
        return null;
      }
    } catch (e, stacktrace) {
      _printError(e, stacktrace);
    }
    return null;
  }

  Future<bool> createOrder(Map map) async {
    log("map $map");
    log(
      jsonEncode(map),
    );

    try {
      accesstoken = sharedPreferencesManager.getAccessToken()!;

      final response = await http.post(
        Uri.parse('${baseUrl}orders'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': 'bearer $accesstoken'
        },
        body: jsonEncode(map),
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        log('Failed to create order.');
        return false;
      }
    } catch (e, stacktrace) {
      _printError(e, stacktrace);
    }
    log('Failed to add to CART.');
    return false;
  }

  Future<Orders?> getOrder() async {
    try {
      accesstoken = sharedPreferencesManager.getAccessToken()!;

      final response = await http.get(
        Uri.parse('${baseUrl}orders/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': 'Bearer $accesstoken'
        },
      );
      if (response.statusCode == 200) {
        return Orders.fromJson(jsonDecode(response.body));
      } else {
        log('getOrders() failed');
        return null;
      }
    } catch (e, stacktrace) {
      _printError(e, stacktrace);
    }
    log('failed for getOrders()');
    return null;
  }
}
