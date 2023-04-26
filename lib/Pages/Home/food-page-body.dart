import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/Utils/dimensions.dart';
import 'package:fooddelivery/Widgets/custom-text-widget.dart';
import 'package:fooddelivery/Widgets/icon-and-text-widget.dart';
import 'package:fooddelivery/Widgets/small-text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currentPage = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Column(
      children: [
        /**
         * Slider Container
         */
        Container(
          height: Dimensions.pageViewWholeContainer,
          margin: EdgeInsets.only(top: Dimensions.width10),
          child: PageView.builder(
            controller: pageController,
            physics: BouncingScrollPhysics(
              decelerationRate: ScrollDecelerationRate.normal,
            ),
            itemCount: 7,
            itemBuilder: (context, index) {
              return _buildPageItem(index);
            },
          ),
        ),

        /**
         * Dots Indicator
         */
        DotsIndicator(
          dotsCount: 7,
          position: _currentPage,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),

        /**
         * Sized Box
         */
        SizedBox(
          height: Dimensions.height30,
        ),

        /**
         * Popular Text
         */
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.value25, bottom: Dimensions.height15),
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            CustomTextWidget(text: 'Popular'),
            SizedBox(
              width: Dimensions.width10,
            ),
            Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food Pairing'))
          ]),
        ),

        /**
         * Food List
         */
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(
                  left: Dimensions.value25,
                  right: Dimensions.value25,
                  bottom: Dimensions.width10),
              child: Row(
                children: [
                  /**
                     * This container is responsible for Image showing
                     */
                  Container(
                    width: Dimensions.width120,
                    height: Dimensions.width120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.value25),
                      color: Colors.white54,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/paneer.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: Dimensions.width100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.height20),
                          bottomRight: Radius.circular(Dimensions.height20),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.height10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextWidget(text: 'Tasty Indian Food'),
                            SizedBox(
                              height: Dimensions.width10,
                            ),
                            SmallText(text: 'With Indian tradition'),
                            SizedBox(
                              height: Dimensions.width10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconAndTextWidget(
                                    icon: Icons.circle_sharp,
                                    text: 'Normal',
                                    size: Dimensions.width15,
                                    iconColor: Colors.amber),
                                IconAndTextWidget(
                                    icon: Icons.location_on,
                                    size: Dimensions.width15,
                                    text: '2.5km',
                                    iconColor: Colors.blue),
                                IconAndTextWidget(
                                    icon: Icons.access_time_rounded,
                                    size: Dimensions.width15,
                                    text: '25mins ',
                                    iconColor: Colors.red),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix4 = new Matrix4.identity();
    if (index == _currentPage.floor()) {
      var currentScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      /**
       * diagonal3Values(1, currentScale, 1) This is for scaling up and down
       * setTranslationRaw(0, currentTrans, 0) This is for shifting little bit down
       */
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 1);
    } else if (index == _currentPage.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPage - index + 1) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 1);
    } else if (index == _currentPage.floor() - 1) {
      var currentScale = 1 - (_currentPage - index) * (1 - _scaleFactor);
      var currentTrans = _height * (1 - currentScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 1);
    } else {
      var currentScale = 0.8;
      matrix4 = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix4,
      child: Stack(children: [
        /**
         * Main Container
         */
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.symmetric(horizontal: Dimensions.height7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.value25),
            color: index.isEven
                ? Color.fromARGB(255, 194, 200, 202)
                : Color(0xFF482532),
            image: const DecorationImage(
              image: AssetImage('assets/images/pizza.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        /**
         * Below Container
         */
        Align(
          alignment: Alignment.bottomCenter,
          child: BelowContainer(),
        ),
      ]),
    );
  }
}

class BelowContainer extends StatelessWidget {
  const BelowContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      height: Dimensions.pageViewTextContainer,
      margin: EdgeInsets.only(
          left: Dimensions.height28,
          right: Dimensions.height28,
          bottom: Dimensions.height15 + 1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.value25),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFe8e8e8),
              blurRadius: 5.0,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(5, 0),
            )
          ]),

      /**
       * Below Image text widget container Data
       */
      child: Container(
        padding: EdgeInsets.all(Dimensions.height10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(text: 'Italian Side'),
            SizedBox(
              height: Dimensions.height10,
            ),
            Row(
              children: [
                Wrap(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      size: Dimensions.height20,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                SmallText(text: '4.5'),
                SizedBox(
                  width: Dimensions.width10,
                ),
                SmallText(text: '1600'),
                SizedBox(
                  width: Dimensions.width10,
                ),
                SmallText(text: 'Comments')
              ],
            ),
            SizedBox(
              height: Dimensions.height15,
            ),
            RowIcons(),
          ],
        ),
      ),
    );
  }
}

class RowIcons extends StatelessWidget {
  const RowIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconAndTextWidget(
            icon: Icons.circle_sharp, text: 'Normal', iconColor: Colors.amber),
        IconAndTextWidget(
            icon: Icons.location_on, text: '2.5km', iconColor: Colors.blue),
        IconAndTextWidget(
            icon: Icons.access_time_rounded,
            text: '25mins ',
            iconColor: Colors.red),
      ],
    );
  }
}
