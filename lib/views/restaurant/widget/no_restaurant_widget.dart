import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/custom_button.dart';
import 'package:chopnow_restaurant/common/reusable_text.dart';
import 'package:chopnow_restaurant/common/size.dart';
import 'package:chopnow_restaurant/views/create_restaurant/create_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NoRestaurantWidget extends StatelessWidget {
  const NoRestaurantWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReuseableText(
            title: "No restaurant found..",
            style: TextStyle(fontSize: 25.sp, color: Tcolor.gray),
          ),
          SizedBox(height: 20.h),
          CustomButton(
            title: "Create a new Restaurant",
            btnHeight: 55.h,
            btnWidth: width / 1.5,
            onTap: () {
              Get.to(() => const CreateRestaurant(),
              transition: Transition.cupertino, duration: const Duration(milliseconds: 900));
            },
          ),
        ],
      ),
    );
  }
}
