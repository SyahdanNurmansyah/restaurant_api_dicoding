import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_api/data/api/api_services.dart';
import 'package:restaurant_api/static/restaurant_list_response.dart';
import 'package:restaurant_api/screens/home/restaurant_card.dart';
import 'package:restaurant_api/static/navigator_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<RestaurantListResponse> _futureRestaurantList;

  @override
  void initState() {
    super.initState();
    _futureRestaurantList = ApiServices().getRestaurantList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _futureRestaurantList,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CupertinoActivityIndicator());

              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                final restaurantList = snapshot.data!.restaurants;

                return ListView.builder(
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
                );

              default:
                return const SizedBox();
            }
          },
        ),
      ),
      // body: ListView.builder(
      //   itemCount: restaurantList.length,
      //   itemBuilder: (context, index) {
      //     final restaurant = restaurantList[index];
      //     return RestaurantCard(
      //       restaurants: restaurantList[index],
      //       onTap: () {
      //         Navigator.pushNamed(
      //           context,
      //           NavigatorRoutes.detailRoute.name,
      //           arguments: restaurant,
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
