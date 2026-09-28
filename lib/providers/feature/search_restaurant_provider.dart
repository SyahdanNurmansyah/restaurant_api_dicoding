// import 'package:flutter/material.dart';
// import 'package:restaurant_api/data/api/api_services.dart';
// import 'package:restaurant_api/models/restaurants.dart';
// import 'package:restaurant_api/static/search_restaurant_result_state.dart';

// class SearchRestaurantProvider extends ChangeNotifier {
//   final ApiServices _apiServices;
//   SearchRestaurantProvider(this._apiServices);

//   SearchRestaurantResultState _resultState = SearchRestaurantNoneState();
//   SearchRestaurantResultState get resultState => _resultState;

//   Future<void> searchRestaurant(String query) async {
//     if (query.trim().isEmpty) {
//       _resultState = SearchRestaurantLoadingState();
//       notifyListeners();
//       return;
//     }
//     try {
//       final result = await _apiServices.serchRestaurant(query);

//       _resultState = SearchRestaurantLoadedState(result);
//     } catch (e) {
//       _resultState = SearchRestaurantErrorState(e.toString());
//     }

//     notifyListeners();
//   }
// }
