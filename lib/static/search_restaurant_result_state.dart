import 'package:restaurant_api/models/restaurants.dart';

sealed class SearchRestaurantResultState {}

class SearchRestaurantLoadingState extends SearchRestaurantResultState {}

class SearchRestaurantNoneState extends SearchRestaurantResultState {}

class SearchRestaurantErrorState extends SearchRestaurantResultState {
  final String error;
  SearchRestaurantErrorState(this.error);
}

class SearchRestaurantLoadedState extends SearchRestaurantResultState {
  final List<Restaurants> restaurants;
  SearchRestaurantLoadedState(this.restaurants);
}
