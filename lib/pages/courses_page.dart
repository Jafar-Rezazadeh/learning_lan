import 'package:flutter/material.dart';
import 'package:languege_learning/models/color_pallet.dart';
import 'package:languege_learning/widgets/0globalWidgets/new_courses.dart';
import 'package:languege_learning/widgets/coursesPage/popular_l_card.dart';
import 'package:languege_learning/widgets/coursesPage/show_all_lan_btn.dart';
import 'package:languege_learning/widgets/homePage/carousel_sec.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final List<String> myCoolStrings = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Some other item'
  ];

  final List<String> _results = [];

  void _handleSearch(String input) {
    _results.clear();

    for (var str in myCoolStrings) {
      if (str.toLowerCase().contains(input.toLowerCase())) {
        setState(() {
          _results.add(str);
        });
      }
    }
  }

  // heart of widget
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //serach bar
              customSearchBar(screenHeight, screenWidth),
              //
              const SizedBox(height: 15),
              _results.isEmpty
                  ? Column(
                      children: [
                        //langueges
                        languegesWidget(screenHeight, screenWidth),
                        //
                        SizedBox(height: screenHeight / 90),
                        //new courses
                        const NewCourses(title: "جدیدترین دوره ها"),
                        //
                        SizedBox(height: screenHeight / 700),
                        //pupolar courses
                        const NewCourses(title: "دوره های محبوب"),
                        //
                        SizedBox(height: screenHeight / 50),
                      ],
                    )
                  : SizedBox(
                      height: 100,
                      width: 100,
                      child: ListView.builder(
                        itemCount: _results.length,
                        itemBuilder: (context, index) => Text(_results[index]),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  // search widget
  Widget customSearchBar(screenHeight, screenWidth) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 10),
      height: 40,
      color: Colors.transparent,
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // filter button
          ElevatedButton(
            style: elevatedButtonStyle(ColorPallet().amberDeepLow),
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.candlestick_chart),
                SizedBox(width: 5),
                Text(
                  "فیلتر",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
          ),
          // search text field
          SizedBox(
            height: 40,
            width: screenWidth / 1.58,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              style: const TextStyle(
                color: Color(0xff020202),
                fontSize: 15,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
              onChanged: _handleSearch,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 2, color: Colors.grey.shade200),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
                ),
                hintText: "جستجوی دوره ها",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  decorationThickness: 6,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _results.clear();
                    });
                  },
                  child: const Icon(
                    Icons.clear,
                    size: 20,
                  ),
                ),
                suffixIconColor: Colors.grey,
                prefixIcon: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    size: 20,
                  ),
                ),
                prefixIconColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget languegesWidget(screenHeight, screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // two popular languages
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //right side
              popularLCard(screenHeight, screenWidth, "US", "انگلیسی", 2642, 8),
              //leftside
              popularLCard(screenHeight, screenWidth, "fr", "فرانسوی", 642, 6),
            ],
          ),
          //
          const SizedBox(height: 10),
          // all languages
          ElevatedButton(
            style: elevetedButtonStyle(),
            onPressed: () {},
            child: showAllLangs(screenHeight, screenWidth),
          ),
        ],
      ),
    );
  }

  elevetedButtonStyle() {
    return ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        shadowColor:
            MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.2)),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        enableFeedback: false,
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(5));
  }
}
