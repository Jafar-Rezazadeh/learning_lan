import 'package:flutter/material.dart';
import 'package:languege_learning/models/color_pallet.dart';

Widget acceptEmail(Size size) {
  String desc =
      "شما هنوز ایمیل خود را تأیید نکرده‌اید. برای تأیید ایمیل، روی لینک فعال‌سازی که به آدرس mohammadhossein@gmail.com ارسال شده، کلیک کنید.";
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    height: size.height / 8.2,
    width: double.infinity,
    decoration: BoxDecoration(
      color: ColorPallet().orengeMid,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // desc
        Text(
          desc,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height / 63,
          ),
        ),
        // action butons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // retry the accepting
            SizedBox(
              height: size.height / 26,
              child: TextButton(
                style: textButtonStyle(),
                onPressed: () {},
                child: Text(
                  "ارسال مجدد ایمیل",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    color: ColorPallet().darkBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            //
            SizedBox(
              height: size.height / 90,
              child: VerticalDivider(
                color: Colors.black,
                thickness: 1,
                width: size.width / 20,
              ),
            ),
            // update email
            SizedBox(
              height: size.height / 26,
              child: TextButton(
                style: textButtonStyle(),
                onPressed: () {},
                child: Text(
                  "ویرایش ایمیل",
                  style: TextStyle(
                    fontSize: size.height / 50,
                    color: ColorPallet().darkBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

textButtonStyle() {
  return ButtonStyle(
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
  );
}
