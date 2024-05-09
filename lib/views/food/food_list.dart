import 'package:chopnow_restaurant/common/background_container.dart';
import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/reusable_text.dart';
import 'package:chopnow_restaurant/views/food/food_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chopnow_restaurant/common/uidata.dart';

//import 'widget/food_tile.dart';
class FoodList extends StatelessWidget {
  const FoodList({super.key});
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolor.primary,
        centerTitle: true,
        title: ReuseableText(title: "Food List", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500)),
      ),
      body: BackgroundContainer(child: 
        Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: ListView.builder(
            itemCount: foods.length,
            itemBuilder:(context, i) {
              final food = foods[i];
              return FoodTile(food: food);
            }
            
          ),
        ),
      ),
    );
  }
}
