import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restaurant_api/static/customer_review_request.dart';
import 'package:restaurant_api/static/restaurant_detail_response.dart';
import 'package:restaurant_api/static/restaurant_list_response.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<RestaurantListResponse> getRestaurantList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));

    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load restaurant details');
    }
  }

  Future<CustomerReviewRequest> postReview(
    String id,
    String name,
    String review,
  ) async {
    final request = await http.post(
      Uri.parse('$_baseUrl/review'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'id': id, 'name': name, 'review': review}),
    );
    debugPrint('STATUS: ${request.statusCode}');
    debugPrint('BODY: ${request.body}');
    if (request.statusCode == 201) {
      return CustomerReviewRequest.fromJson(jsonDecode(request.body));
    } else {
      throw Exception('Failed to post review');
    }
  }
}
