import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/reusable_text.dart';
import 'package:chopnow_restaurant/common/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food});
  final Map<String, dynamic> food;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: Container(
        height: 152.h,
        decoration: BoxDecoration(
          color: Tcolor.placeHolder,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: SizedBox(
                    width: 124.w,
                    height: 124.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: Image.asset(
                        food['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 24.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReuseableText(
                      title: food['name'],
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          color: Tcolor.Text),
                    ),
                    ReuseableText(
                      title: "Delivery time: ${food['time']}",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: Tcolor.Text),
                    ),
                    SizedBox(
                      height: 36.h,
                      width: width * 0.7,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: food['additives'].length,
                          itemBuilder: (context, i) {
                            String title = food['additives'][i]['title'];
                            return Container(
                              margin: EdgeInsets.only(right: 10.w),
                              decoration: BoxDecoration(
                                  color: Tcolor.purplr,
                                  borderRadius: BorderRadius.circular(18.r)),
                              child: Center(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: ReuseableText(
                                    title: title,
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Tcolor.Text),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                )
              ],
            ),
            Positioned(
              right: 10.w,
              top: 10.h,
              child: Container(
                height: 38.h,
                width: 90.w,
                decoration: BoxDecoration(
                    color: Tcolor.Secondary,
                    borderRadius: BorderRadius.circular(12.r)),
                child: ReuseableText(
                  title: "\u20A6 ${food["price"].toString()}",
                  style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Tcolor.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
