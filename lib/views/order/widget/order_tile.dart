import 'package:chopnow_restaurant/common/reusable_text.dart';
import 'package:chopnow_restaurant/hooks/fetch_food_ById.dart';
import 'package:chopnow_restaurant/models/food_byId_model.dart';
import 'package:chopnow_restaurant/models/order_request_model.dart';
import 'package:chopnow_restaurant/views/restaurant/widget/restaurant_dashbord.dart';
import 'package:chopnow_restaurant/views/shimmers/food_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chopnow_restaurant/common/size.dart';
import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:get/get.dart';








class OrderDetailsTile extends HookWidget {
  const OrderDetailsTile({
    super.key, required this.order
  });
    final OrderResponseModel order;
    
  @override
  Widget build(BuildContext context) {
    final foodHookResult = useFetchFoodByFoodId(order.orderItems[0].foodId.toString());
    FoodByIdModel? singleFood = foodHookResult.data;



    
    return singleFood == null
              ? const Center(
                  child:  FoodListShimmer(),
                ) :GestureDetector(
                  onTap: () {
                    Get.to(() => RestaurantDashbord());

                  },
                  child: Stack(
                                clipBehavior: Clip.hardEdge,
                                children: [
                  Container(
                    height: 180.h,
                    width: width,
                    decoration: BoxDecoration(
                        color: Tcolor.white,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24.r),
                            child: Image.network(
                              singleFood.imageUrl[0],
                              width: 100.w,
                              height: 160.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReuseableText(
                                title: singleFood.title,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Tcolor.gray,
                                    fontWeight: FontWeight.bold),
                              ),
                              ReuseableText(
                                title: "Order Id: ${order.id}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Tcolor.gray,
                                    fontWeight: FontWeight.w400),
                              ),
                              Row(
                                children: [
                                   Icon(Icons.location_city, color: Tcolor.gray, size: 30.sp,),
                                   SizedBox(
                                    width: 10.w,
                                   ),
                                  ReuseableText(
                                    title: order.restaurantAddress,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Tcolor.gray,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: width * 0.7,
                                height: 40.h,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: order.orderItems[0].additives.length,
                                    itemBuilder: (context, i) {
                                      var additives = order.orderItems[0].additives[i];
                                      return Container(
                                        margin: EdgeInsets.only(right: 10.w),
                                        decoration: BoxDecoration(
                                          color: Tcolor.placeHolder,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15.r),
                                          ),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(4.h),
                                            child: ReuseableText(
                                              title: additives,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Tcolor.primary,
                                                  fontWeight: FontWeight.w400),
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
                    ),
                  ),
                                ],
                              ),
                );
  }
}



