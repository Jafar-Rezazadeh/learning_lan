import 'package:flutter/material.dart';
import 'package:languege_learning/models/color_pallet.dart';

Widget mapWayLeaderBourd(Size size) {
  String limage1 = "assets/images/pPage/image1.png";
  String limage2 = "assets/images/pPage/image2.png";
  String mimage1 = "assets/images/pPage/image5.png";
  String mimage2 = "assets/images/pPage/image6.png";
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    height: size.height / 7,
    color: Colors.transparent,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // mapWay(right side)
        mAndLItem(size, "نقشه راه دوره", 10, 3, "ایستگاه کامل شده", -2, limage1,
            limage2),
        // leaderBourd(Left side)
        mAndLItem(size, "لیدربورد", 400, 23, "موقعیت شما", 1, mimage1, mimage2),
      ],
    ),
  );
}

mAndLItem(Size size, String title, int maxN, int minN, String bInfo, double x,
    String image1, String image2) {
  return Container(
    height: double.infinity,
    width: size.width / 4.9,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 5,
          offset: Offset(x, 2),
        )
      ],
    ),
    child: Stack(
      children: [
        // =========== images ============
        Positioned(
          left: 0.0,
          bottom: 0.0,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(10)),
            child: Image.asset(
              image1,
              height: size.height / 12,
              width: size.width / 12,
            ),
          ),
        ),
        Positioned(
          left: 0.0,
          bottom: 0.0,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.only(bottomLeft: Radius.circular(10)),
            child: Image.asset(
              image2,
              height: size.height / 7,
              width: size.width / 7,
            ),
          ),
        ),
        // ==============================
        // title
        Positioned(
          top: size.height / 100,
          right: size.width / 50,
          child: Text(
            title,
            style: TextStyle(
              color: ColorPallet().amberDeep,
              fontSize: size.width / 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // contents
        Positioned(
          bottom: size.height / 100,
          right: size.width / 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // numbers
              Text(
                "$minN از $maxN",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width / 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // bottom info text
              Text(
                bInfo,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width / 60,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
