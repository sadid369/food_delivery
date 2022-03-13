import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_products_controller.dart';
import 'package:food_delivery/helper/dependencies.dart' as dep;
import 'package:food_delivery/pages/home/food/popular_food_detail.dart';
import 'package:food_delivery/pages/home/food/recomended_food_detail.dart';
import 'package:food_delivery/pages/home/food_page_body.dart';

import 'package:food_delivery/pages/home/main_food_page.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecommenedFoodDetail(),
    );
  }
}
