import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/widget/big_text.dart';
import 'package:foodapp/widget/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({ Key? key }) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController _pageController = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 320,
      child: PageView.builder(
        itemCount: 5,
        controller: _pageController,
        itemBuilder: (context, index) {
          return _buildPageItem(index);
        },
      ),
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: const EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/image/food0.png'),
            )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: const EdgeInsets.only(
              left: 30,
              right: 30,
              bottom: 15,
            ),
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: 'Indonesian Food'),
                const SizedBox(
                  height: 10,
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
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}