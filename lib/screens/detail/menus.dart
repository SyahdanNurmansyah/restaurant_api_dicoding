import 'package:flutter/material.dart';
import 'package:restaurant_api/models/restaurant_detail.dart';
import 'package:restaurant_api/styles/typography/restaurant_text_styles.dart';

class Menus extends StatelessWidget {
  final RestaurantDetail restaurant;
  const Menus({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final menus = [
      ...restaurant.menus.foods.map((food) => food.name),
      ...restaurant.menus.drinks.map((drink) => drink.name),
    ];
    return SizedBox(
      height: 180,
      child: ListView.builder(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: menus.length,
        itemBuilder: (context, index) {
          final menuName = menus[index];
          return Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 140,
                  maxWidth: 140,
                  minHeight: 140,
                  minWidth: 140,
                ),
                child: Card(
                  // color: Theme.of(context).cardColor,
                  shadowColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      spacing: 8,
                      children: [
                        Center(
                          child: Icon(
                            Icons.restaurant_menu,
                            color: Theme.of(context).hoverColor,
                            size: 60,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: .start,
                            mainAxisAlignment: .start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                child: Text(
                                  'Kategori',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                              Text(
                                menuName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
