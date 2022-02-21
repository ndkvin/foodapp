import 'package:flutter/material.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widget/app_icon.dart';
import 'package:foodapp/widget/big_text.dart';
import 'package:foodapp/widget/icon_and_text.dart';
import 'package:foodapp/widget/small_text.dart';
import 'package:foodapp/utils/colors.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.height350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image/food0.png',
                  ),
                  fit: BoxFit.cover,
                )
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                ),
                AppIcon(
                  icon: Icons.shopping_basket_outlined,
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.height350-Dimensions.height30,
            bottom: 0,
            child: Container(
              height: 700,
              padding: EdgeInsets.only(
                left: Dimensions.width40,
                right: Dimensions.width40,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.height20),
                  topRight: Radius.circular(Dimensions.height20)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: 'Indonesian Food'),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15,
                            );
                          },
                        )
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: '4.2',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: '1234',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(
                        text: 'comments',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(
                        icon: Icons.circle_sharp,
                        text: 'Normal',
                        iconColor: AppColors.iconColor1,
                      ),
                      IconAndText(
                        icon: Icons.location_on,
                        text: '1.2km',
                        iconColor: AppColors.mainColor,
                      ),
                      IconAndText(
                        icon: Icons.access_time_rounded,
                        text: 'Normal',
                        iconColor: AppColors.iconColor2,
                      ),
                    ],
                  )
                ],
              ),
            ) 
          )
        ],
      ),
    );
  }
}