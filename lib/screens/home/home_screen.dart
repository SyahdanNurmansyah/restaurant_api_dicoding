import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_api/data/api/api_services.dart';
import 'package:restaurant_api/providers/home/restaurant_list_provider.dart';
import 'package:restaurant_api/screens/home/headers.dart';
import 'package:restaurant_api/screens/home/home_page_title.dart';
import 'package:restaurant_api/static/restaurant_list_response.dart';
import 'package:restaurant_api/screens/home/restaurant_card.dart';
import 'package:restaurant_api/static/navigator_routes.dart';
import 'package:restaurant_api/static/restaurant_list_result_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RestaurantListProvider>().fetchRestaurantList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Headers()),
            SliverToBoxAdapter(child: HomePageTitle()),

            SliverToBoxAdapter(
              child: Consumer<RestaurantListProvider>(
                builder: (context, value, child) {
                  return switch (value.resultState) {
                    RestaurantListLoadingState() => const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                        backgroundColor: Colors.lightGreen,
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
              ),
              // child: FutureBuilder(
              //   future: _futureRestaurantList,
              //   builder: (context, snapshot) {
              //     switch (snapshot.connectionState) {
              //       case ConnectionState.waiting:
              //         return Center(
              //           child: CircularProgressIndicator(
              //             color: Colors.green,
              //             backgroundColor: Colors.lightGreen,
              //           ),
              //         );

              //       case ConnectionState.done:
              //         if (snapshot.hasError) {
              //           return Center(child: Text(snapshot.error.toString()));
              //         }

              //         final restaurantList = snapshot.data!.restaurants;

              //         return ListView.builder(
              //           shrinkWrap: true,
              //           physics: NeverScrollableScrollPhysics(),
              //           itemCount: restaurantList.length,
              //           itemBuilder: (context, index) {
              //             final restaurant = restaurantList[index];

              //             return RestaurantCard(
              //               restaurants: restaurant,
              //               onTap: () {
              //                 Navigator.pushNamed(
              //                   context,
              //                   NavigatorRoutes.detailRoute.name,
              //                   arguments: restaurant.id,
              //                 );
              //               },
              //             );
              //           },
              //         );

              //       default:
              //         return const SizedBox();
              //     }
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
