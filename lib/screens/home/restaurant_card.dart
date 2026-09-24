import 'package:flutter/material.dart';
import 'package:restaurant_api/models/restaurants.dart';
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
          padding: const EdgeInsets.all(12),
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
                  child: Image.network(
                    'https://restaurant-api.dicoding.dev/images/small/${restaurants.pictureId}',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 0.8,
                            color: Theme.of(context).dividerColor,
                            backgroundColor: Theme.of(context).hoverColor,
                          ),
                        ),
                      );
                    },

                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.image_not_supported_rounded,
                          size: 22,
                          color: Theme.of(context).hoverColor,
                        ),
                      );
                    },
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
                      style: RestaurantTextStyles.bodyLargeBold,
                    ),

                    const SizedBox(height: 12),

                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.store_outlined, size: 16),
                        Text(restaurants.city),
                      ],
                    ),

                    Row(
                      spacing: 8,
                      children: [
                        Icon(
                          restaurants.rating == 0
                              ? Icons.star_border
                              : restaurants.rating >= 5
                              ? Icons.star
                              : Icons.star_half,
                          color: Colors.amber,
                          size: 18,
                        ),
                        Text(restaurants.rating.toString()),
                      ],
                    ),

                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.access_time, size: 16),
                        Text('Setiap hari'),
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
