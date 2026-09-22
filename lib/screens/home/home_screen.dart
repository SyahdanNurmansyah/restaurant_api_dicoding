import 'package:flutter/material.dart';
import 'package:restaurant_api/models/restaurant.dart';
import 'package:restaurant_api/screens/home/headers.dart';
import 'package:restaurant_api/screens/home/restaurant_card.dart';
import 'package:restaurant_api/static/navigator_routes.dart';
import 'package:restaurant_api/widgets/custom_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: restaurantList.length,
        itemBuilder: (context, index) {
          final restaurant = restaurantList[index];
          return RestaurantCard(
            restaurants: restaurantList[index],
            onTap: () {
              Navigator.pushNamed(
                context,
                NavigatorRoutes.detailRoute.name,
                arguments: restaurant,
              );
            },
          );
        },
      ),
    );
  }
}
