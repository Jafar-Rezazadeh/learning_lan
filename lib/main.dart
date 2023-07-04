import 'package:flutter/material.dart';
import 'package:languege_learning/models/color_pallet.dart';
import 'package:languege_learning/pages/courses_page.dart';
import 'package:languege_learning/pages/home_page.dart';
import 'package:languege_learning/pages/profile_page.dart';
import 'package:languege_learning/widgets/0globalWidgets/drawer_widget.dart';

void main(List<String> args) {
  runApp(const AppMain());
}

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  final GlobalKey<ScaffoldState> _mainScaffoldKey = GlobalKey<ScaffoldState>();
  PageController pageController = PageController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    double screnHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: ColorPallet().darkBlue,
            fontSize: screnHeight / 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Scaffold(
        key: _mainScaffoldKey,
        endDrawer: const CustomDrawerWidget(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              const HomePage(),
              const CoursesPage(),
              ProfilePage(mainScaffoldKey: _mainScaffoldKey),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: screnHeight / 7,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: BottomNavigationBar(
              fixedColor: ColorPallet().amberDeep,
              unselectedItemColor: ColorPallet().darkBlue,
              currentIndex: pageIndex,
              onTap: (value) {
                setState(() => pageIndex = value);
                pageController.animateToPage(
                  value,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOutExpo,
                );
              },
              items: const [
                BottomNavigationBarItem(
                  label: "خانه",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "دوره ها",
                  icon: Icon(Icons.video_collection_outlined),
                ),
                BottomNavigationBarItem(
                  label: "پروفایل",
                  icon: Icon(Icons.person_outline_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
