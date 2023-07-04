import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:languege_learning/models/color_pallet.dart';

class CustomDrawerWidget extends StatefulWidget {
  const CustomDrawerWidget({super.key});

  @override
  State<CustomDrawerWidget> createState() => _CustomDrawerWidgetState();
}

class _CustomDrawerWidgetState extends State<CustomDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // blur for backdrop
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0,
          ),
          child: const SizedBox.expand(),
        ),
        // the drawer
        Drawer(
          backgroundColor: Colors.transparent,
          elevation: 0,
          width: screenwidth / 1.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: screenHeight / 1.08,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
                ),
                child: Column(
                  children: [
                    // close button
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "بستن",
                            style: TextStyle(color: ColorPallet().midBlue),
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            size: screenHeight / 50,
                            color: ColorPallet().midBlue,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight / 12),
                    // items
                    drawerItem(Icons.settings, "تنظیمات", context),
                    //
                    drawerItem(
                        Icons.help_center_outlined, "درباره GO2TRain", context),
                    //
                    drawerItem(Icons.call, "تماس با ما", context),
                    //
                    drawerItem(Icons.email_outlined, "ارسال ایمیل به پشتیبانی",
                        context),
                    //
                    drawerItem(Icons.privacy_tip_outlined,
                        "سیاست های حریم خصوصی", context),
                    //
                    drawerItem(Icons.contact_support_outlined, "سوالات متداول",
                        context),
                    //
                    //Exit from profile
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: screenHeight / 12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "خروج از حساب",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: screenHeight / 45,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Icon(
                              Icons.exit_to_app_outlined,
                              size: screenHeight / 30,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  drawerItem(IconData icon, String title, BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: screenHeight / 12,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.keyboard_arrow_left),
            SizedBox(
              child: Row(
                children: [
                  Text(
                    title,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenHeight / 45,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    textDirection: TextDirection.rtl,
                    icon,
                    color: Colors.black87,
                    size: screenHeight / 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
