// ignore_for_file: avoid_print

import 'package:chopnow_restaurant/common/size.dart';
import 'package:chopnow_restaurant/models/api_error_model.dart';
import 'package:chopnow_restaurant/models/food_byId_model.dart';
import 'package:chopnow_restaurant/models/hook%20models/hook_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchFoodByFoodId(String foodId) {
  final food = useState<FoodByIdModel?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      final url = Uri.parse("$appBaseUrl/api/foods/$foodId");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        food.value = foodByIdModelFromJson(response.body);
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
    //Future.delayed(const Duration(seconds: 3));
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: food.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
