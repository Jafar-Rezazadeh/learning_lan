import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:languege_learning/models/color_pallet.dart';
import 'package:languege_learning/widgets/0globalWidgets/card_little_flag.dart';

Widget carouselSec(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  int itemsCount = 5;
  return FlutterCarousel.builder(
    itemBuilder: (context, index, realIndex) =>
        carouselCard(screenHeight, screenWidth),
    options: CarouselOptions(
      initialPage: itemsCount,
      height: screenHeight / 3.5,
      floatingIndicator: true,
      slideIndicator: CircularWaveSlideIndicator(
        currentIndicatorColor: ColorPallet().amberDeep,
        indicatorBackgroundColor: Colors.grey[400],
        indicatorRadius: 3,
        itemSpacing: 10,
      ),
      reverse: true,
    ),
    itemCount: itemsCount,
  );
}

//each card design for carousel
Widget carouselCard(screenHeight, screenWidth) {
  int allCourses = 34;
  int observed = 23;
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: [
      SizedBox(height: screenHeight / 60),
      Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: screenHeight / 3.8,
            width: screenWidth,
            margin: const EdgeInsets.only(left: 5, right: 5),
            color: Colors.transparent,
            child: Container(
              width: screenWidth,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  ColorPallet().amberDeep,
                  ColorPallet().amberDeepLow,
                ]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 5,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // ===================
                    // countryflag
                    cardLittleFlag(ColorPallet().amberDeep,
                        Size(screenWidth / 6.6, screenHeight / 20), "US"),
                    // ===================
                    //title
                    Text(
                      "آموزش زبان انگلیسی - سطح A2",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight / 40,
                      ),
                    ),
                    // ===================
                    //observed courses
                    Text(
                      "$observed از $allCourses درس مشاهده شده",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: screenHeight / 50,
                      ),
                    ),
                    // ===================
                    //action buttons
                    SizedBox(height: screenHeight / 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: screenHeight / 18,
                          width: screenWidth / 2.6,
                          child: ElevatedButton(
                            style: elevatedButtonStyle(null),
                            onPressed: () {},
                            child: Text(
                              "ادامه آموزش",
                              style: TextStyle(
                                color: ColorPallet().amberDeep,
                                fontSize: screenHeight / 42,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight / 18,
                          width: screenWidth / 2.6,
                          child: ElevatedButton(
                            style: elevatedButtonStyle(Colors.transparent),
                            onPressed: () {},
                            child: Text(
                              "جزئیات دوره",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenHeight / 42,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          //isactive or not
          Positioned(
            top: -(screenHeight / 80),
            left: 0.0,
            right: 0.0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorPallet().darkBlue,
                ),
                height: screenHeight / 35,
                width: screenWidth / 8,
                child: Text(
                  textAlign: TextAlign.center,
                  "دوره فعال",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight / 70,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

elevatedButtonStyle(Color? color) {
  return ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(
          color: color != null ? Colors.white : Colors.transparent,
        ),
      ),
    ),
    elevation: MaterialStateProperty.all<double>(0),
    backgroundColor: MaterialStateProperty.all<Color>(color ?? Colors.white),
  );
}
