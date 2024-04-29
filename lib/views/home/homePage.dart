// ignore_for_file: file_names

import 'package:chopnow_restaurant/common/background_container.dart';
import 'package:chopnow_restaurant/common/color_extension.dart';
import 'package:chopnow_restaurant/common/custom_appbar.dart';
import 'package:chopnow_restaurant/common/size.dart';
import 'package:chopnow_restaurant/views/home/widgets/orders/cancelled_orders.dart';
import 'package:chopnow_restaurant/views/home/widgets/orders/delivered_orders.dart';
import 'package:chopnow_restaurant/views/home/widgets/orders/deliveries.dart';
import 'package:chopnow_restaurant/views/home/widgets/orders/new_orders.dart';
import 'package:chopnow_restaurant/views/home/widgets/orders/picked_orders.dart';
import 'package:chopnow_restaurant/views/home/widgets/orders/preparing.dart';
import 'package:chopnow_restaurant/views/home/widgets/orders/ready_orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/home_tabs.dart';
import 'widgets/home_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: orderList.length, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Tcolor.primary,
        flexibleSpace: const CustomAppBar(),
      ),
      body: BackgroundContainer(
        //color: Colors.transparent,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 30.h,
            ),
            const HomeTiles(),
            SizedBox(
              height: 30.h,
            ),
            HomeTabs(tabController: _tabController),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              height: height * 0.7,
              color: Colors.transparent,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  NewOrders(),
                  Preparing(),
                  ReadyOrders(),
                 PickedOrders(),
                  Deliveries(),
                  DeliveredOrders(),
                  CancelledOrders()
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
