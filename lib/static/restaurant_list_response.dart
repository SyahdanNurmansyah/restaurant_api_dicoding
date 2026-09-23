import 'package:restaurant_api/models/restaurants.dart';

class RestaurantListResponse {
  final bool error;
  final String message;
  final int count;
  final List<Restaurants> restaurants;

  RestaurantListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantListResponse(
      error: json["error"],
      message: json["message"],
      count: json["count"],
      restaurants: json["restaurants"] != null
          ? List<Restaurants>.from(
              json["restaurants"]!.map((item) => Restaurants.fromJson(item)),
            )
          : <Restaurants>[],
    );
  }
}
