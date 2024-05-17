import 'package:chopnow_restaurant/controlllers/save_restaurant_id.dart';
import 'package:chopnow_restaurant/hooks/fetch_food_ById.dart';
import 'package:chopnow_restaurant/hooks/fetch_restaurant_order.dart';
import 'package:chopnow_restaurant/views/order/widget/order_tile.dart';
import 'package:chopnow_restaurant/views/shimmers/food_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewOrders extends HookWidget {
  const NewOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantId = StorageService.getRestaurantId();

    final hookResult = useFetchRestaurantOrder(restaurantId.toString());
    
    
    final orders = hookResult.data;
    final  isLoading = hookResult.isLoading;

    
    
        return isLoading ? FoodListShimmer() : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: Colors.transparent
                    ),
                    child:
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, i) {
                        final order = orders[i];
                        return OrderDetailsTile(order: order, );
                      },
                    ),
                    )
                  );
  }
}