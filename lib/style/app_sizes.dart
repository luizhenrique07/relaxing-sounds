import 'package:flutter/widgets.dart';

class AppSizes {
  static double width;
  static double height;
  static double blockSize;
  static double blockSizeVertical;
  static double textScaleFactor;

  static void loadAppSizes(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    AppSizes.width = queryData.size.width;
    AppSizes.height = queryData.size.height;
    AppSizes.blockSize = AppSizes.width / 100;
    AppSizes.blockSizeVertical = AppSizes.height / 100;
    AppSizes.textScaleFactor = queryData.textScaleFactor;
  }
}
