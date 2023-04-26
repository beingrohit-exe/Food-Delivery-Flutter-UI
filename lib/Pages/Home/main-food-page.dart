import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fooddelivery/Pages/Home/food-page-body.dart';
import 'package:fooddelivery/Utils/dimensions.dart';
import 'package:fooddelivery/Widgets/custom-text-widget.dart';
import 'package:fooddelivery/Widgets/small-text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /**We are using two containers because the color of app bar will slightly change while scrolling up */
      body: SafeArea(
        child: Column(
          children: [
            //Showing the header of Application
            Container(
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height7, bottom: Dimensions.width10),
                padding: EdgeInsets.symmetric(horizontal: Dimensions.value25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        CustomTextWidget(
                          text: 'INDIA ',
                          color: Colors.deepPurple,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SmallText(
                              text: 'Noida',
                              color: Colors.black54,
                            ),
                            Icon(Icons.arrow_drop_down_rounded)
                          ],
                        )
                      ],
                    ),
                    Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(
                        Icons.search,
                        size: Dimensions.value25,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.height15),
                          color: Colors.deepPurple),
                    )
                  ],
                ),
              ),
            ),
            //Showing the body of Application
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.normal),
                child: FoodPageBody(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
