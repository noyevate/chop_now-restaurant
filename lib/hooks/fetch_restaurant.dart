// ignore_for_file: avoid_print

import 'package:chopnow_restaurant/common/size.dart';
import 'package:chopnow_restaurant/models/api_error_model.dart';
import 'package:chopnow_restaurant/models/hook%20models/restaurant_hook_model.dart';
import 'package:chopnow_restaurant/models/restaurant_respons_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

FetchRestaurant useFetchRestaurant() {
  final box = GetStorage();
  final restaurants = useState<List<RestaurantResponsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    String accessToken = box.read("token");

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    isLoading.value = true;

    try {
      final url = Uri.parse("$appBaseUrl/api/restaurant");
      print(url.toString());
      final response = await http.get(url, headers: headers);
      print("useFetchRestaurant: ${response.body}");
      if (response.statusCode == 200) {
        restaurants.value = restaurantResponsModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchRestaurant(
    data: restaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
