import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimentions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/exandable_text_widget.dart';
import 'package:food_delivery/widgets/icon_and_text_widget.dart';
import 'package:food_delivery/widgets/small_text.dart';

class PopularFoodDetail extends StatefulWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  State<PopularFoodDetail> createState() => _PopularFoodDetailState();
}

class _PopularFoodDetailState extends State<PopularFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: Dimensions.popularFoodImageSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/image/Burger.jpg",
                  ),
                ),
              ),
            ),
          ),
          //icon widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                ),
              ],
            ),
          ),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImageSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: "Chinese Side",
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(text: "Introduce"),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  // ignore: prefer_const_constructors
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text:
                              "Has your mouth ever started to water as you  got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into Has your mouth ever started to water as you got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite intoHas your mouth ever started to water as you  got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into Has your mouth ever started to water as you got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite intoHas your mouth ever started to water as you  got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into Has your mouth ever started to water as you got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite intoHas your mouth ever started to water as you  got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into Has your mouth ever started to water as you got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          right: Dimensions.width20,
          left: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColorColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              Dimensions.radius20 * 2,
            ),
            topRight: Radius.circular(
              Dimensions.radius20 * 2,
            ),
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.radius20,
              ),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.remove,
                  color: AppColors.signColor,
                ),
                SizedBox(
                  width: Dimensions.width10 / 2,
                ),
                BigText(text: "0"),
                SizedBox(
                  width: Dimensions.width10 / 2,
                ),
                Icon(
                  Icons.add,
                  color: AppColors.signColor,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            child: BigText(
              text: "\$10 | Add to cart",
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Dimensions.radius20,
              ),
              color: AppColors.mainColor,
            ),
          )
        ]),
      ),
    );
  }
}
