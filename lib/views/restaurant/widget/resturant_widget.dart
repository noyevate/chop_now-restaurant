import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/custom_button.dart';
import 'package:chopnow_restaurant/common/dashboard_text.dart';
import 'package:chopnow_restaurant/common/reusable_text.dart';
import 'package:chopnow_restaurant/common/row_text_widget.dart';
import 'package:chopnow_restaurant/common/size.dart';
import 'package:chopnow_restaurant/models/restaurant_respons_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ResturantWidget extends StatelessWidget {
   ResturantWidget({
    super.key,
    required this.restaurant,
  });

    List<RestaurantResponsModel> restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(
            height: 40.h,
          ),
          Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReuseableText(
                      title: restaurant[0].title ,
                      style: TextStyle(
                          fontSize: 35.sp, color: Tcolor.Text)),
                  Padding(
                    padding: EdgeInsets.only(top: 1.h, right: 10.w),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300.r),
                        child: Container(
                          color: Tcolor.white,
                          child: Padding(
                            padding: EdgeInsets.all(2.h),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: Image.network(
                                restaurant[0].logoUrl,
                                fit: BoxFit.cover,
                                width: 50.w,
                                height: 50.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 30.h,
          ),
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashbordTextWidget(
                      first: "0", second: "Total Orders"),
                  DashbordTextWidget(
                      first: "0", second: "Processed Orders"),
                  DashbordTextWidget(
                      first: "0", second: "Cancelled Orders"),
                ],
              )
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 30.h,
          ),
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashbordTextWidget(
                      first: "0", second: "Total Deliveries"),
                  DashbordTextWidget(
                      first: "0", second: "Processed Orders"),
                  DashbordTextWidget(
                      first: "0", second: "Cancelled Orders"),
                ],
              )
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 30.h,
          ),
          RowText(first: "RestaurantId", second: restaurant[0].id),
          SizedBox(
            height: 30.h,
          ),
          RowText(first: "Manager Id", second: restaurant[0].userId),
          SizedBox(
            height: 30.h,
          ),
          RowText(
              first: "Restaurant Address",
              second: restaurant[0].coords.address),
          SizedBox(
            height: 30.h,
          ),
          RowText(
              first: "Restaurant Manager", second: restaurant[0].owner),
          SizedBox(
            height: 30.h,
          ),
          RowText(first: "Working hours", second: restaurant[0].time),
          const Divider(
            thickness: 1,
          ),
          CustomButton(
            title: "Edit Restaurant",
            btnHeight: 50.h,
            btnWidth: width / 1.5,
            onTap: () {
              Get.snackbar("Edit Restaurant", "message", backgroundColor: Tcolor.Secondary, colorText: Tcolor.white);
            },
          )
        ]),
      );
  }
}
