import 'package:flutter/material.dart';
import 'package:languege_learning/models/color_pallet.dart';
import 'package:languege_learning/widgets/0globalWidgets/score_widget.dart';
import 'package:languege_learning/widgets/profilePage/accept_email_section.dart';
import 'package:languege_learning/widgets/profilePage/active_courses.dart';
import 'package:languege_learning/widgets/profilePage/followers_information.dart';
import 'package:languege_learning/widgets/profilePage/mapway_leaderbourd.dart';

class ProfilePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> mainScaffoldKey;
  const ProfilePage({super.key, required this.mainScaffoldKey});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight / 6),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          flexibleSpace: SizedBox(
            height: screenHeight / 4.45,
            width: screenWidth,
            child: customAppbar(screenHeight, screenWidth),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            // name
            Text(
              "محمد حسین حیدر زاده",
              style: TextStyle(
                color: ColorPallet().brown,
                fontWeight: FontWeight.bold,
                fontSize: screenHeight / 36,
              ),
            ),
            //
            SizedBox(height: screenHeight / 150),
            // score
            scoreWidget(Size(screenWidth / 8, screenHeight / 25), 196, true),
            //
            SizedBox(height: screenHeight / 60),
            // accept email
            acceptEmail(Size(screenWidth / 1.08, screenHeight / 1.1)),
            //
            SizedBox(height: screenHeight / 60),
            // follower / freinds - information
            followersInformation(screenHeight, screenWidth),
            //
            SizedBox(height: screenHeight / 60),
            // active courses
            activeCourses(screenHeight, screenWidth),
            //
            SizedBox(height: screenHeight / 60),
            // map / leader board
            mapWayLeaderBourd(Size(screenWidth, screenHeight)),
          ],
        ),
      ),
    );
  }

  //app bar
  //  action button style
  actionButonstyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
          ColorPallet().darkBlue.withOpacity(0.3)),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      elevation: MaterialStateProperty.all<double>(0),
      enableFeedback: false,
    );
  }

  Widget customAppbar(screenHeight, screenWidth) {
    return Stack(
      children: [
        Container(
          height: screenHeight / 7,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(50)),
            color: ColorPallet().amberDeep,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // notification
              Positioned(
                left: screenWidth / 25,
                bottom: screenHeight / 30,
                child: SizedBox(
                  height: screenHeight / 17,
                  width: screenHeight / 17,
                  child: ElevatedButton(
                    style: actionButonstyle(),
                    onPressed: () {},
                    child: const Center(
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // menu
              Positioned(
                right: screenWidth / 25,
                bottom: screenHeight / 30,
                child: SizedBox(
                  height: screenHeight / 17,
                  width: screenHeight / 17,
                  child: ElevatedButton(
                    style: actionButonstyle(),
                    onPressed: () {
                      widget.mainScaffoldKey.currentState!.openEndDrawer();
                    },
                    child: const Center(
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // profile image
        Positioned(
          top: screenHeight / 13,
          right: 0.0,
          left: 0.0,
          child: CircleAvatar(
            radius: screenHeight / 15,
            backgroundColor: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: ColorPallet().amberDeepLow.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                    offset: const Offset(0, -4),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/images/Ellipse.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
