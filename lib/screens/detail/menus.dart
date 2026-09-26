import 'package:flutter/material.dart';
import 'package:restaurant_api/models/restaurant_detail.dart';

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
        itemCount: menus.length,
        scrollDirection: Axis.horizontal,
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
                  shadowColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      spacing: 8,
                      children: [
                        Center(
                          child: Icon(
                            Icons.restaurant_menu_rounded,
                            color: Theme.of(context).hoverColor,
                            size: 60,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: .end,
                            children: [
                              Text(
                                menuName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Theme.of(context).dividerColor,

                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.fontSize,
                                ),
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
