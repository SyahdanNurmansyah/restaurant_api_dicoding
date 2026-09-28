// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:restaurant_api/providers/feature/search_restaurant_provider.dart';
// import 'package:restaurant_api/screens/home/restaurant_card.dart';
// import 'package:restaurant_api/screens/home/restaurant_list_screen.dart';
// import 'package:restaurant_api/static/navigator_routes.dart';
// import 'package:restaurant_api/static/search_restaurant_result_state.dart';

// class SearchResultList extends StatelessWidget {
//   const SearchResultList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SearchRestaurantProvider>(
//       builder: (context, value, child) {
//         return switch (value.resultState) {
//           SearchRestaurantLoadingState() => const Center(
//             child: CircularProgressIndicator(),
//           ),
//           SearchRestaurantNoneState() => const Center(child: Text('Cari')),

//           SearchRestaurantErrorState(error: var error) => Center(
//             child: Text(error),
//           ),
//           SearchRestaurantLoadedState(restaurants: var restaurants) =>
//             restaurants.isEmpty
//                 ? const Center(child: Text('Restaurant tidak ditemukan'))
//                 : ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: restaurants.length,
//                     itemBuilder: (context, index) {
//                       final restaurant = restaurants[index];
//                       return RestaurantCard(
//                         restaurants: restaurant,
//                         onTap: () {
//                           Navigator.pushNamed(
//                             context,
//                             NavigatorRoutes.detailRoute.name,
//                             arguments: restaurant,
//                           );
//                         },
//                       );
//                     },
//                   ),
//         };
//       },
//     );
//   }
// }
