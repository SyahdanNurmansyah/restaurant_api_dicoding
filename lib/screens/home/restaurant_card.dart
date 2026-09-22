import 'package:flutter/material.dart';
import 'package:restaurant_api/models/restaurant.dart';
import 'package:restaurant_api/styles/typography/restaurant_text_styles.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurants restaurants;
  final Function() onTap;
  const RestaurantCard({
    super.key,
    required this.restaurants,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shadowColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: .start,
            mainAxisAlignment: .start,
            spacing: 12,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 140,
                    maxWidth: 140,
                    minHeight: 100,
                    maxHeight: 100,
                  ),
                  child: Image.asset(
                    'assets/images/restaurant1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Expanded(
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      restaurants.name,
                      style: RestaurantTextStyles.titleMedium,
                    ),

                    const SizedBox(height: 12),

                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.pin_drop, size: 16),
                        Text(
                          restaurants.city,
                          style: RestaurantTextStyles.bodyLargeRegular,
                        ),
                      ],
                    ),

                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        Text(
                          restaurants.rating.toString(),
                          style: RestaurantTextStyles.bodyLargeRegular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
