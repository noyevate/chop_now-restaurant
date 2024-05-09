import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/custom_button.dart';
import 'package:chopnow_restaurant/common/size.dart';
import 'package:chopnow_restaurant/controlllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewOrders extends StatelessWidget {
  const NewOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
        return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: Colors.yellow,
                    ),
                    child: CustomButton(
                    title: "Logout",
                    raduis: 20.r,
                    btnColor: Tcolor.Text,
                    onTap: () {
                      controller.logout();
                    },
                    btnHeight: 70.h,
                    btnWidth: width/2,
                  ),
                  );
  }
}