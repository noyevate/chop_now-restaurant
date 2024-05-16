
import 'package:chopnow_restaurant/common/background_container.dart';
import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/custom_button.dart';
import 'package:chopnow_restaurant/common/reusable_text.dart';
import 'package:chopnow_restaurant/views/restaurant/widget/restaurant_dashbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widget/no_restaurant_widget.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Tcolor.primary,
        title: ReuseableText(
          title: "Restaurant",
          style: TextStyle(
              color: Tcolor.Text, fontSize: 30.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: BackgroundContainer(
        child: Column(
          children: [
            const NoRestaurantWidget(),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(title: "title",
              onTap: () {
                Get.to(() => const RestaurantDashbord());
              },
            )
          ],
        ),
      ),
    );
  }
}
