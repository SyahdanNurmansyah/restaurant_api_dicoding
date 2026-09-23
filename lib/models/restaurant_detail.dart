import 'package:restaurant_api/models/categories.dart';
import 'package:restaurant_api/models/customer_review.dart';
import 'package:restaurant_api/models/menus.dart';

class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Categories> categories;
  final Menus menus;
  final num rating;
  // final List<CustomerReview> customerReviews;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    // required this.customerReviews,
  });

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) {
    return RestaurantDetail(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      city: json["city"],
      address: json["address"],
      pictureId: json["pictureId"],
      categories: (json["categories"] as List)
          .map((item) => Categories.fromJson(item))
          .toList(),

      menus: Menus.fromJson(json["menus"]),
      rating: json["rating"],
      // customerReviews: (json["customerReviews"] as List)
      //     .map((item) => CustomerReview.fromJson(item))
      //     .toList(),
    );
  }
}
