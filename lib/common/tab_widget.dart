import 'package:flutter/material.dart';
import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabWidget extends StatelessWidget {
  final String title;

  const TabWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: TextStyle(
          color: Tcolor.purplr,
          fontSize: 32.h,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
