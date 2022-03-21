// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_products_controller.dart';
import 'package:food_delivery/controllers/recommended_product_contoller.dart';
import 'package:food_delivery/helper/dependencies.dart' as dep;
import 'package:food_delivery/pages/cart/cart_page.dart';
import 'package:food_delivery/pages/home/food/popular_food_detail.dart';
import 'package:food_delivery/pages/home/food/recomended_food_detail.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';

import 'package:food_delivery/pages/home/main_food_page.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dem',
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
