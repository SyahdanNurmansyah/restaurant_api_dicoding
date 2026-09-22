import 'package:flutter/material.dart';
import 'package:restaurant_api/models/restaurant.dart';
import 'package:restaurant_api/styles/typography/restaurant_text_styles.dart';

class DetailScreen extends StatelessWidget {
  final Restaurants restaurant;
  const DetailScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/restaurant2.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox.square(dimension: 16),
              Card(
                shadowColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    spacing: 8,
                    mainAxisAlignment: .spaceBetween,
                    crossAxisAlignment: .center,

                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            restaurant.name,
                            style: RestaurantTextStyles.headlineSmall,
                          ),
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
                        ],
                      ),

                      Column(
                        spacing: 8,
                        crossAxisAlignment: .end,

                        children: [
                          Row(
                            spacing: 4,
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 20),

                              Text('${restaurant.rating} (Ulasan)'),
                            ],
                          ),

                          ElevatedButton(
                            onPressed: () {},

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade50,
                              shadowColor: const Color.fromRGBO(0, 0, 0, 0),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: Colors.grey, width: 1),
                              ),
                            ),
                            child: Row(
                              spacing: 8,
                              children: [
                                Icon(
                                  Icons.edit_note_outlined,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                                Text(
                                  'Berikan ulasan',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
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
            ],
          ),
        ),
      ),
    );
  }
}
