import 'package:chopnow_restaurant/common/background_container.dart';
import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/custom_appbar.dart';
import 'package:chopnow_restaurant/common/size.dart';
import 'package:chopnow_restaurant/controlllers/login_controller.dart';
import 'package:chopnow_restaurant/hooks/fetch_restaurant.dart';
import 'package:chopnow_restaurant/models/login_response_model.dart';
import 'package:chopnow_restaurant/models/restaurant_respons_model.dart';
import 'package:chopnow_restaurant/views/auth/login_page.dart';
import 'package:chopnow_restaurant/views/shimmers/restaurant_shimers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'resturant_widget.dart';

class RestaurantDashbord extends HookWidget {
  const RestaurantDashbord({super.key});

   

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

    final hookResult = useFetchRestaurant();
    List<RestaurantResponsModel>? restaurant = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;
    

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Tcolor.primary,
        flexibleSpace: const CustomAppBar(),
      ),
      body: BackgroundContainer(
        child: isLoading
            ? const RestaurantShimmer()
            : restaurant != null ? Container(
              width: width,
              height: height,
              child: ListView.builder(
                itemCount: restaurant.length,
                itemBuilder: (context, i) {
                  return SizedBox(
                    height: height,
                    width: width,
                    child: ResturantWidget(restaurant: restaurant),
                  );
                },
              ),
            ) : const Center(
                child: CircularProgressIndicator(), // Show a loading indicator
              ),
      ),
    );
  }
}
