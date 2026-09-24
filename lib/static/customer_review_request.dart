import 'package:restaurant_api/models/customer_review.dart';

class CustomerReviewRequest {
  final bool error;
  final String message;
  final List<CustomerReview> customerReviews;

  CustomerReviewRequest({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  factory CustomerReviewRequest.fromJson(Map<String, dynamic> json) {
    return CustomerReviewRequest(
      error: json["error"],
      message: json["message"],
      customerReviews: json["customerReviews"] != null
          ? List<CustomerReview>.from(
              json["customerReview"]!.map(
                (review) => CustomerReview.fromJson(review),
              ),
            )
          : <CustomerReview>[],
    );
  }
}
