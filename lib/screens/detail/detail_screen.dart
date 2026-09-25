import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_api/providers/detail/restaurant_detail_provider.dart';
import 'package:restaurant_api/screens/detail/body_of_restaurant_detail.dart';
import 'package:restaurant_api/static/restaurant_detail_result_state.dart';

class DetailScreen extends StatefulWidget {
  final String restaurantId;
  const DetailScreen({super.key, required this.restaurantId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<RestaurantDetailProvider>().fetchRestaurantDetail(
        widget.restaurantId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: SafeArea(
        child: Consumer<RestaurantDetailProvider>(
          builder: (context, value, child) {
            return switch (value.resultState) {
              RestaurantDetailLoadingState() => Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                  backgroundColor: Colors.lightGreen,
                ),
              ),

              RestaurantDetailLoadedState(data: var restaurantDetail) =>
                BodyOfTourismDetail(restaurant: restaurantDetail),

              RestaurantDetailErrorState(error: var message) => Center(
                child: Text(message),
              ),
              _ => const SizedBox(),
            };
          },
        ),
      ),
    );
  }
}
