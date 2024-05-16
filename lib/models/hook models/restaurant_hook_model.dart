
import 'package:chopnow_restaurant/models/restaurant_respons_model.dart';
import 'package:flutter/material.dart';

class FetchRestaurant {
  final List<RestaurantResponsModel>? data;
  final bool isLoading; // to determin wether our data is loading
  final Exception? error;
  final VoidCallback? refetch;

  FetchRestaurant({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}