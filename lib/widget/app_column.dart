import 'package:flutter/material.dart';
import 'package:foodapp/widget/big_text.dart';
import 'package:foodapp/widget/icon_and_text.dart';
import 'package:foodapp/widget/small_text.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';

class AppColumn extends StatelessWidget {
  
  final String text;

  const AppColumn({ Key? key, required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.height26),
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
              })
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
    );
  }
}