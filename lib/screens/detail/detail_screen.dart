import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_api/data/api/api_services.dart';
import 'package:restaurant_api/models/restaurants.dart';
import 'package:restaurant_api/screens/detail/body_of_restaurant_detail.dart';
import 'package:restaurant_api/static/restaurant_detail_response.dart';
import 'package:restaurant_api/styles/typography/restaurant_text_styles.dart';

class DetailScreen extends StatefulWidget {
  final String restaurantId;
  const DetailScreen({super.key, required this.restaurantId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // final Completer<Restaurants> _completerRestaurant = Completer<Restaurants>();
  late final Future<RestaurantDetailResponse> _futureRestaurantDetail;

  @override
  void initState() {
    super.initState();
    _futureRestaurantDetail = ApiServices().getRestaurantDetail(
      widget.restaurantId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: SafeArea(
        child: FutureBuilder(
          future: _futureRestaurantDetail,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    backgroundColor: Colors.lightGreen,
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                final restaurantData = snapshot.data!.restaurant;
                return BodyOfTourismDetail(restaurant: restaurantData);
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
