import 'package:flutter/material.dart';
import 'package:restaurant_api/models/restaurant_detail.dart';
import 'package:restaurant_api/screens/detail/customer_review_card.dart';
import 'package:restaurant_api/screens/detail/menus.dart';
import 'package:restaurant_api/styles/typography/restaurant_text_styles.dart';

class BodyOfTourismDetail extends StatelessWidget {
  final RestaurantDetail restaurant;
  const BodyOfTourismDetail({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Hero(
              tag: restaurant.pictureId,
              reverseCurve: Curves.easeInOut,
              child: Image.network(
                'https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}',
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
                  return Column(
                    spacing: 12,
                    children: [
                      Icon(
                        Icons.image_not_supported_rounded,
                        size: 24,
                        color: Theme.of(context).hoverColor,
                      ),
                      Text(
                        'Failed to load image',
                        style: TextStyle(color: Theme.of(context).hoverColor),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),

          const SizedBox.square(dimension: 16),
          Card(
            shadowColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                spacing: 12,
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .center,

                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          restaurant.name,
                          style: RestaurantTextStyles.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          spacing: 8,
                          children: [
                            Icon(
                              Icons.location_city,
                              size: 18,
                              color: Colors.grey,
                            ),
                            Text(restaurant.city),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: .start,
                          spacing: 8,
                          children: [
                            Icon(Icons.store, size: 18, color: Colors.grey),
                            Expanded(child: Text(restaurant.address)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Row(
                        spacing: 4,
                        children: [
                          Icon(
                            restaurant.rating == 0
                                ? Icons.star_border
                                : restaurant.rating >= 5
                                ? Icons.star
                                : Icons.star_half,
                            color: Colors.amber,
                            size: 20,
                          ),
                          Text('${restaurant.customerReviews.length} (Ulasan)'),
                        ],

                        // ],
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          overlayColor: Colors.transparent,
                          foregroundColor: Theme.of(context)
                              .colorScheme
                              .primary,
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.map_rounded,
                          color: Colors.green,
                          size: 16,
                        ),
                        label: Text(
                          'Arahkan',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Card(
            shadowColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(restaurant.description),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text('Menus', style: RestaurantTextStyles.titleMedium),
                Text(
                  'Foods & Drinks',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Menus(restaurant: restaurant),

          const SizedBox(height: 12),

          CustomerReviewCard(restaurantDetail: restaurant),
        ],
      ),
    );
  }
}
