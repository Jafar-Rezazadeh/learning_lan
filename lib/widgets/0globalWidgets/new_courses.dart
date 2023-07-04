import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:languege_learning/models/color_pallet.dart';
import 'package:languege_learning/widgets/0globalWidgets/card_little_flag.dart';
import 'package:languege_learning/widgets/0globalWidgets/card_little_rate.dart';

class NewCourses extends StatefulWidget {
  final String title;
  const NewCourses({super.key, required this.title});

  @override
  State<NewCourses> createState() => _NewCoursesState();
}

class _NewCoursesState extends State<NewCourses> {
  int carouselCount = 5;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight / 3.2,
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // section title
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          //carousel
          FlutterCarousel.builder(
            itemCount: carouselCount,
            itemBuilder: (context, index, realIndex) {
              return carouselSellCard(screenHeight, screenWidth);
            },
            options: CarouselOptions(
              reverse: true,
              initialPage: carouselCount,
              height: screenHeight / 3.9,
              showIndicator: false,
            ),
          ),
        ],
      ),
    );
  }

  Widget carouselSellCard(screenHeight, screenWidth) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(0, 2),
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 10,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  //image from some were in country
                  Image.asset(
                    'assets/images/image1.png',
                    height: screenHeight / 20,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.5),
                    colorBlendMode: BlendMode.darken,
                  ),

                  // rate
                  Positioned(
                    top: 5,
                    left: 5,
                    child: cardLittleRate(ColorPallet().amberDeepLow,
                        Size(screenWidth / 8, screenHeight / 30), 4.5),
                  ),

                  // country flag
                  Positioned(
                    top: 5,
                    right: 5,
                    child: cardLittleFlag(Colors.black.withOpacity(0.2),
                        Size(screenWidth / 8, screenHeight / 30), "RU"),
                  ),
                  // profile image
                  Positioned(
                    top: screenHeight / 50,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'assets/images/Ellipse.png',
                        height: screenHeight / 16,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //title course
            Text(
              "آموزش زبان روسی - سطح A2",
              style: TextStyle(
                color: ColorPallet().darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: screenHeight / 40,
              ),
            ),
            // teacher
            Text.rich(
              style: TextStyle(
                fontSize: screenHeight / 55,
                color: ColorPallet().midBlue,
              ),
              TextSpan(
                children: [
                  const TextSpan(
                    text: "مدرس: ",
                  ),
                  TextSpan(
                    text: "علی نقوی",
                    style: TextStyle(
                      color: ColorPallet().darkBlue,
                      fontSize: screenHeight / 55,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight / 70),
            // price and course time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // course time
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // icon
                    Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      child: Icon(
                        Icons.access_time_outlined,
                        size: screenHeight / 45,
                        color: ColorPallet().midBlue.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(width: screenWidth / 70),
                    //content
                    Text(
                      "23 ساعت آموزش",
                      style: TextStyle(
                        color: ColorPallet().midBlue.withOpacity(0.7),
                        fontSize: screenHeight / 65,
                      ),
                    )
                  ],
                ),
                //price
                Row(
                  children: [
                    Text(
                      "\$",
                      style: TextStyle(
                        color: ColorPallet().midBlue.withOpacity(0.7),
                        fontSize: screenHeight / 45,
                      ),
                    ),
                    SizedBox(width: screenWidth / 70),
                    Text(
                      "1,200,000 تومان",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: ColorPallet().midBlue.withOpacity(0.7),
                        fontSize: screenHeight / 65,
                      ),
                    ),
                    Text(
                      "  رایگان!",
                      style: TextStyle(
                        color: ColorPallet().lightGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight / 60,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
