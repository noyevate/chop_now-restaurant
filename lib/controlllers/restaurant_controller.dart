import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/size.dart';
import 'package:chopnow_restaurant/models/api_error_model.dart';
import 'package:chopnow_restaurant/views/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RestaurantController extends GetxController{
  final box = GetStorage();
  RxBool _isLoading = false.obs;

  bool get isLoading =>_isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }


  void createRestaurant(String data) async{
    setLoading = true;
    String accessToken = box.read("token");

    var url = Uri.parse("$appBaseUrl/api/restaurant/");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };
    try {
      var response = await http.post(url, headers: headers, body: data);
      print(response.reasonPhrase);
      if (response.statusCode == 201) {
        setLoading = false;
        Get.snackbar("Restaurant created Successfully",
            "We look forward to taking more orders from you",
            colorText: Tcolor.Text,
            duration: const Duration(seconds: 2),
            backgroundColor: Tcolor.primary,
            icon: const Icon(Ionicons.fast_food_outline));

        Get.to(() => const HomePage());
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Creating restaurant Unsuccessful", error.message,
            colorText: Tcolor.white,
            duration: const Duration(seconds: 2),
            
            backgroundColor: Tcolor.red,
            icon: const Icon(Icons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setLoading = false;
    }
  }

  // void removeFromCart(String productId, Function refetch) async{
  //   setLoading = true;
  //   String accessToken = box.read("token");

  //   var url = Uri.parse("$appBaseUrl/api/cart/$productId");
  //   Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $accessToken'
  //   };
  //   try {
  //     var response = await http.delete(url, headers: headers);
  //     print(response.body);
  //     if (response.statusCode == 200) {
  //       setLoading = false;
  //       refetch();

  //       Get.snackbar("Product removed successfully",
  //           "Bon appétit! Get ready to savor tasty treats with us.",
  //           duration: const Duration(seconds: 2),
  //           colorText: Tcolor.Text,
  //           backgroundColor: Tcolor.primary,
  //           icon: const Icon(Ionicons.fast_food_outline));
  //     } else {
  //       var error = apiErrorFromJson(response.body);
  //       Get.snackbar("Deleting from cart unsuccessful", error.message,
  //       duration: const Duration(seconds: 2),
  //           colorText: Tcolor.white,
  //           backgroundColor: Tcolor.red,
  //           icon: const Icon(Icons.error_outline));
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   } finally {
  //     setLoading = false;
  //   }
  // }
}



// 