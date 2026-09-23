import 'package:restaurant_api/models/restaurant_detail.dart';
import 'package:restaurant_api/models/restaurants.dart';

class RestaurantDetailResponse {
  final bool error;
  final String message;
  final RestaurantDetail restaurant;

  RestaurantDetailResponse({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantDetailResponse(
      error: json["error"],
      message: json["message"],
      restaurant: RestaurantDetail.fromJson(json["restaurant"]),
    );
  }
}
