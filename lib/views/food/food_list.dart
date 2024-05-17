import 'package:chopnow_restaurant/common/background_container.dart';
import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/reusable_text.dart';
import 'package:chopnow_restaurant/controlllers/login_controller.dart';
import 'package:chopnow_restaurant/controlllers/save_restaurant_id.dart';
import 'package:chopnow_restaurant/hooks/fetch_all_restaurant_foods.dart';
import 'package:chopnow_restaurant/models/login_response_model.dart';
import 'package:chopnow_restaurant/views/auth/login_page.dart';
import 'package:chopnow_restaurant/views/food/food_tile.dart';
import 'package:chopnow_restaurant/views/shimmers/food_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FoodList extends HookWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    LoginResponseModel? user;
    final loginController = Get.put(LoginController());

    String? token = box.read('token');

    if (token != null) {
      user = loginController.getUserInfo();
    }

    if (token == null) {
      return const LoginPage();
    }
    // if (user != null && user.verification == false) {
    //   //return const VerificationPage();
    // }

    
    final restaurantId = StorageService.getRestaurantId();

    //String restaurantId = restaurant[0].id.toString();
    final hookResult = useFetchRestaurantFoods(restaurantId.toString());
    final foods = hookResult.data;
    final  isLoading = hookResult.isLoading;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolor.primary,
        centerTitle: true,
        title: ReuseableText(
          title: "Food List",
          style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
        ),
      ),
      body: BackgroundContainer(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: foods == null
              ? const Center(
                  child:  CircularProgressIndicator(),
                )
              : foods.isEmpty
                  ? Center(
                      child: ReuseableText(
                        title: "please wait",
                        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                      ),
                    ) :
                   isLoading ? const FoodListShimmer(): ListView.builder(
                      itemCount: foods.length,
                      itemBuilder: (context, i) {
                        final food = foods[i];
                        return FoodTile(food: food);
                      },
                    ),
        ),
      ),
    );
  }
}
