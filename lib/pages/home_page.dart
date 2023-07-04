import 'package:flutter/material.dart';
import 'package:languege_learning/widgets/0globalWidgets/new_courses.dart';
import 'package:languege_learning/widgets/homePage/carousel_sec.dart';

import '../widgets/homePage/mid_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Carousrel
            carouselSec(context),
            //today tasks
            midSection(context),
            //new courses
            const NewCourses(
              title: "دوره های جدید و جذاب",
            )
          ],
        ),
      ),
    );
  }
}
