
import 'package:chopnow_restaurant/common/background_container.dart';
import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/custom_appbar.dart';
import 'package:chopnow_restaurant/controlllers/login_controller.dart';
import 'package:chopnow_restaurant/controlllers/save_restaurant_id.dart';
import 'package:chopnow_restaurant/hooks/fetch_restaurant.dart';
import 'package:chopnow_restaurant/models/login_response_model.dart';
import 'package:chopnow_restaurant/models/restaurant_respons_model.dart';
import 'package:chopnow_restaurant/views/auth/login_page.dart';
import 'package:chopnow_restaurant/views/restaurant/widget/restaurant_dashbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'widget/no_restaurant_widget.dart';

class RestaurantPage extends HookWidget {
  const RestaurantPage({super.key});

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
    useEffect(() {
      if (restaurant.isNotEmpty) {
        StorageService.saveRestaurantId(restaurant[0].id);
      }
      return;
    }, [restaurant]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Tcolor.primary,
        flexibleSpace: const CustomAppBar(),
        automaticallyImplyLeading: false,
      ),
      body:  BackgroundContainer(
        child: Column(
          children: [
            if (restaurant.isNotEmpty)
              const Expanded(
                child: RestaurantDashbord(),
              )
            else
              const Expanded(
                child: Center(
                  child: NoRestaurantWidget(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
