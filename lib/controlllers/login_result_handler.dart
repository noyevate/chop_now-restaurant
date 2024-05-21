import 'package:chopnow_restaurant/controlllers/save_restaurant_id.dart';
import 'package:chopnow_restaurant/hooks/fetch_restaurant.dart';
import 'package:chopnow_restaurant/models/restaurant_respons_model.dart';
import 'package:chopnow_restaurant/views/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class LoginResultHandler extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurant();
      List<RestaurantResponsModel>? restaurant = hookResult.data ?? [];

    useEffect(() {
      if (restaurant != null && restaurant.isNotEmpty) {
        StorageService.saveRestaurantId(restaurant[0].id);
        Get.offAll(() => const HomePage(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 900));
      }
      return;
    }, [restaurant]);

    return Container(); // Placeholder, as this widget will redirect.
  }
}
