import 'package:flutter/material.dart';
import 'package:food_delivery/constants/color.dart';
import 'package:food_delivery/models/rest.dart';
import 'package:food_delivery/screens/home/widget/restInfo.dart';
import 'package:food_delivery/widgets/customAppBar.dart';
import 'package:food_delivery/widgets/food_list.dart';
import 'package:food_delivery/screens/home/widget/restInfo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/food_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;
  final pageController = PageController();
  final restaurant = Restaurant.genrateRe();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(Icons.arrow_back, Icons.search_outlined),
            RestInfo(),
            FoodList(selected, (int index) {
              setState(() {
                selected = index;
              });
              pageController.jumpToPage(index);
            }, restaurant),
            Expanded(
                child: FoodListView(selected, (int index) {
              setState(() {
                selected = index;
              });
            }, pageController, restaurant)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 60,
              child: SmoothPageIndicator(
                controller: pageController,
                count: restaurant.menu.length,
                effect: CustomizableEffect(
                    dotDecoration: DotDecoration(
                        height: 8,
                        width: 8,
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8)),
                    activeDotDecoration: DotDecoration(
                        width: 10,
                        height: 10,
                        color: kBackground,
                        borderRadius: BorderRadius.circular(10),
                        dotBorder: const DotBorder(
                            color: kPrimaryColor, padding: 2, width: 2))),
                onDotClicked: (index) => pageController.jumpToPage(index),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        elevation: 2,
        child: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}
