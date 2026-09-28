import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_api/providers/home/restaurant_list_provider.dart';
import 'package:restaurant_api/screens/home/restaurant_card.dart';
import 'package:restaurant_api/static/navigator_routes.dart';
import 'package:restaurant_api/static/restaurant_list_result_state.dart';

class RestaurantListScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantListProvider>(
      builder: (context, value, child) {
        return switch (value.resultState) {
          RestaurantListLoadingState() => Padding(
            padding: const EdgeInsets.all(16),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
                backgroundColor: Colors.lightGreen,
              ),
            ),
          ),

          RestaurantListLoadedState(data: var restaurantList) =>
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: restaurantList.length,
              itemBuilder: (context, index) {
                final restaurant = restaurantList[index];

                return RestaurantCard(
                  restaurants: restaurant,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NavigatorRoutes.detailRoute.name,
                      arguments: restaurant.id,
                    );
                  },
                );
              },
            ),

          RestaurantListErrorState(error: var message) => Center(
            child: Text(message),
          ),
          _ => const SizedBox(),
        };
      },
    );
  }
}
