import 'package:flutter/material.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimentions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/exandable_text_widget.dart';
import 'package:get/get.dart';

class RecommenedFoodDetail extends StatelessWidget {
  const RecommenedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.initial);
                    },
                    child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                    child: BigText(
                  text: "Chinese Side",
                  size: Dimensions.font26,
                )),
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(
                      Dimensions.radius20,
                    ),
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                child: ExpandableTextWidget(
                    text:
                        "Has your mouth ever started to water as you  got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into Has your mouth ever started to water as you got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite intoHas your mouth ever started to water as you  got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into Has your mouth ever started to water as you got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite intoHas your mouth ever started to water as you  got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into Has your mouth ever started to water as you got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite intoHas your mouth ever started to water as you  got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into Has your mouth ever started to water as you got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into Has your mouth ever started to water as you  got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into Has your mouth ever started to water as you got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite intoHas your mouth ever started to water as you  got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into Has your mouth ever started to water as you got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite intoHas your mouth ever started to water as you  got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into Has your mouth ever started to water as you got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite intoHas your mouth ever started to water as you  got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into Has your mouth ever started to water as you got a whiff of a delicious burger? Have you ever become really hungry after seeing the wonderful site of a hamburger? Do you know the feeling of special sauce oozing onto you fingers as you take your first bite into"),
                margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
              ),
            ],
          ))
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.width20 * 2.5,
                right: Dimensions.width20 * 2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backGroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(
                  text: "\$12.88 " + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  backGroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Container(
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      child: Icon(
                        Icons.favorite,
                        color: AppColors.mainColor,
                      )),
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
        ],
      ),
    );
  }
}
