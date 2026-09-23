import 'package:flutter/material.dart';
import 'package:restaurant_api/models/restaurant_detail.dart';

class CustomerReviewCard extends StatelessWidget {
  final RestaurantDetail restaurantDetail;
  const CustomerReviewCard({super.key, required this.restaurantDetail});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              children: restaurantDetail.customerReviews.map((review) {
                return Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      review.name,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(review.review),
                    const SizedBox(height: 4),
                    Text(
                      review.date,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Divider(thickness: 0.5),
                    ),
                  ],
                );
              }).toList(),
            ),

            TextField(),
          ],
        ),
      ),
    );
  }
}
