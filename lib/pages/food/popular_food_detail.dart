import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:foodapp/widget/app_column.dart';
import 'package:foodapp/widget/app_icon.dart';
import 'package:foodapp/widget/big_text.dart';
import 'package:foodapp/widget/expandable_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  const AppColumn(text: 'Indonesia Enak'),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(text: 'Introduce'),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                        text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum, Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
                    ),
                  )
                ],
              ),
            ) 
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.height40*3,
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.height30,
          horizontal: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.height45),
            topLeft: Radius.circular(Dimensions.height45),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.height20),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                  SizedBox(
                    width: Dimensions.width10/2,
                  ),
                  BigText(text: '0'),
                  SizedBox(
                    width: Dimensions.width10/2,
                  ),
                  Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  )
                ]
              ),
            ),
            Container(
              padding: EdgeInsets.all(Dimensions.height20),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.height20),
              ),
              child: BigText(
                text: '\$12 | Add to cart',
              )
            ),
          ],
        ),
      ),
    );
  }
}