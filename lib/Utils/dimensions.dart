import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  /**
   * S21 Ultra
   * height = 853 and width = 384
   */
  static double pageViewContainer = screenHeight / 3.87;
  static double pageViewTextContainer = screenHeight / 7.1;
  static double pageViewWholeContainer = screenHeight / 2.84;

  static double height10 = screenHeight / 85.3;
  static double height15 = screenHeight / 56.86;

  static double width10 = screenWidth / 38.4;

  static double height20 = screenHeight / 42.65;
  static double height12 = screenHeight / 71.08;

  static double height45 = screenHeight / 18.95;
  static double width45 = screenWidth / 8.53;

  static double value25 = screenHeight / 34.12;

  static double height7 = screenHeight / 121.85;
  static double height28 = screenHeight / 30.46;
  static double height30 = screenHeight / 28.43;
  static double height100 = screenHeight / 8.53;
  static double height210 = screenHeight / 4.06;
  static double width210 = screenWidth / 1.82;
  static double height120 = screenHeight / 7.10;
  static double width120 = screenWidth / 3.2;
  static double width100 = screenWidth / 3.84;
  static double width15 = screenWidth / 25.6;
}
