import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/reusable_text.dart';
import 'package:chopnow_restaurant/controlllers/save_restaurant_id.dart';
import 'package:chopnow_restaurant/hooks/fetch_restaurant_order.dart';
import 'package:chopnow_restaurant/views/order/widget/order_tile.dart';
import 'package:chopnow_restaurant/views/shimmers/food_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReadyOrders extends HookWidget {
  const ReadyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantId = StorageService.getRestaurantId().toString();
    const orderStatus = "Ready";
    const paymentStatus = "Completed";

    final hookResult =
        useFetchOrderByOrderPlaced(restaurantId, paymentStatus, orderStatus);

    final orders = hookResult.data;
    final isLoading = hookResult.isLoading;

    return  isLoading
        ? const FoodListShimmer()
        : Container(
            height: 240.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: Colors.transparent,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 12.w, top: 10.h),
              child: orders == null || orders.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/img/restaurant-store-svgrepo-com.svg",
                            height: 150.h,
                            width: 150.w,
                            
                          ),
                          ReuseableText(
                            title: "No Data",
                            style: TextStyle(
                                color: Tcolor.gray,
                                fontSize: 25.sp,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, i) {
                        final order = orders[i];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child: OrderDetailsTile(
                            order: order,
                          ),
                        );
                      },
                    ),
            ),
          );
  }
}
