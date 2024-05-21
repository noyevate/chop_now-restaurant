// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/size.dart';
import 'package:chopnow_restaurant/controlllers/save_restaurant_id.dart';
import 'package:chopnow_restaurant/hooks/fetch_restaurant.dart';
import 'package:chopnow_restaurant/models/api_error_model.dart';
import 'package:chopnow_restaurant/models/login_response_model.dart';
import 'package:chopnow_restaurant/models/restaurant_respons_model.dart';
import 'package:chopnow_restaurant/views/auth/login_page.dart';
import 'package:chopnow_restaurant/views/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  void loginFunction(String data) async {
    setLoading = true;

    Uri url = Uri.parse("$appBaseUrl/login");

    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        LoginResponseModel data = loginResponseModelFromJson(response.body);

        String userId = data.id;
        String userData = jsonEncode(data);

        box.write(userId, userData);
        box.write('token', data.userToken);
        box.write('userId', data.id);
        box.write('verification', data.verification);

        setLoading = false;
        if (data.userType == "Vendor") {
          Get.snackbar("You are successfully logged in",
              "Bon appétit! you're welcome again.",
              colorText: Tcolor.Text,
              duration: const Duration(seconds: 3),
              backgroundColor: Tcolor.primary,
              icon: const Icon(Ionicons.fast_food_outline));
          
          Get.offAll(() => const HomePage(),
              transition: Transition.fade,
              duration: const Duration(milliseconds: 900));
        } else {
          Get.snackbar("Failed to Login", "Somethin went wrong!",
              colorText: Tcolor.white,
              duration: const Duration(seconds: 3),
              backgroundColor: Tcolor.red,
              icon: const Icon(Icons.error_outline));
        }
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Failed to Login", error.message,
            colorText: Tcolor.white,
            duration: const Duration(seconds: 3),
            backgroundColor: Tcolor.red,
            icon: const Icon(Icons.error_outline));
      }

      // if (data.verification == false) {
      //   Get.offAll(() => const VerificationPage(),
      //   transition: Transition.fade,
      //   duration: const Duration(milliseconds: 900));
      // }
      // if (data.userType) {

      // }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void logout() {
    box.erase();
    Get.offAll(
      () => const LoginPage(),
      transition: Transition.fade,
      duration: const Duration(milliseconds: 900),
    );
  }

  LoginResponseModel? getUserInfo() {
    String? userId = box.read('userId');
    String? data;
    if (userId != null) {
      data = box.read(userId.toString());
    }

    if (data != null) {
      return loginResponseModelFromJson(data);
    }
    return null;
  }
}
