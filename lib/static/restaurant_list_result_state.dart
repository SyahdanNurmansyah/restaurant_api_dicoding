import 'package:restaurant_api/models/restaurants.dart';

sealed class RestaurantListResultState {}

class RestaurantListNoneState extends RestaurantListResultState {}

class RestaurantListLoadingState extends RestaurantListResultState {}

class RestaurantListErrorState extends RestaurantListResultState {
  final String error;
  RestaurantListErrorState(this.error);
}

class RestaurantListLoadedState extends RestaurantListResultState {
  final List<Restaurants> data;
  RestaurantListLoadedState(this.data);
}
