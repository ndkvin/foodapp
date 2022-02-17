import 'package:flutter/material.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/widget/big_text.dart';
import 'package:foodapp/widget/icon_and_text.dart';
import 'package:foodapp/widget/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({ Key? key }) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController _pageController = PageController(viewportFraction: 0.85);

  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 320,
          child: PageView.builder(
            itemCount: 5,
            controller: _pageController,
            itemBuilder: (context, index) {
              return _buildPageItem(index);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            color: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = Matrix4.identity();

    if (index == _currentPageValue.floor()) {
      var _currentScale = 1-(_currentPageValue - index) * (1 - _scaleFactor);
      var _currentTrans = _height*(1-_currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, _currentScale, 1)..setTranslationRaw(0.0, _currentTrans, 0.0);
    } else if(index == _currentPageValue.floor()+ 1) {
      var _currentScale = _scaleFactor + (_currentPageValue-index+1)*(1-_scaleFactor);
      var _currentTrans = _height*(1-_currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, _currentScale, 1)..setTranslationRaw(0.0, _currentTrans, 0.0);
    } else if(index == _currentPageValue.floor() - 1) {
      var _currentScale = 1-(_currentPageValue - index) * (1 - _scaleFactor);
      var _currentTrans = _height*(1-_currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, _currentScale, 1)..setTranslationRaw(0.0, _currentTrans, 0.0);
    } else {
      var _currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, _currentScale, 1)..setTranslationRaw(0,_height*(1-_scaleFactor)/2,0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
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
                bottom: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    offset: Offset(0,5),
                    blurRadius: 6
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5,0),
                    blurRadius: 6
                  )
                ]
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 15,
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
                    const SizedBox(
                      height: 20,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}