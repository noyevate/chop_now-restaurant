import 'package:chopnow_restaurant/common/background_container.dart';
import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/reusable_text.dart';
import 'package:chopnow_restaurant/common/size.dart';
import 'package:chopnow_restaurant/views/add_foods/widgets/additives_info.dart';
import 'package:chopnow_restaurant/views/add_foods/widgets/all_categories.dart';
import 'package:chopnow_restaurant/views/add_foods/widgets/food_info.dart';
import 'package:chopnow_restaurant/views/add_foods/widgets/image_uploads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFoods extends StatefulWidget {
  const AddFoods({super.key});

  @override
  State<AddFoods> createState() => _AddFoodsState();
}

class _AddFoodsState extends State<AddFoods> {
  final PageController _pageController = PageController();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();
  final TextEditingController preparation = TextEditingController();
  final TextEditingController types = TextEditingController();

  final TextEditingController additivePrice = TextEditingController();
  final TextEditingController additiveTitle = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    price.dispose();
    preparation.dispose();
    types.dispose();
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolor.primary,
        centerTitle: true,
        title: Column(
          children: [
            ReuseableText(
              title: "Welcome to the Restaurant Panel",
              style: TextStyle(
                  fontSize: 24.sp,
                  color: Tcolor.Text,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            ReuseableText(
              title: "Fill all required infoto add food items",
              style: TextStyle(
                  fontSize: 24.sp,
                  color: Tcolor.Text,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: BackgroundContainer(
          child: ListView(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              pageSnapping: false,
              children: [
                ChooseCategory(
                  next: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeIn);
                  },
                ),
                ImageUploads(
                  back: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeIn);
                  },
                  next: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeIn);
                  },
                ),
                FoodInfo(
                  back: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeIn);
                  },
                  next: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeIn);
                  },
                  title: title,
                  description: description,
                  price: price,
                  preparation: preparation,
                  types: types,
                ),
                AdditiveInfo(additiveTitle: additiveTitle, additivePrice: additivePrice,),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
