import 'package:flutter/material.dart';
import 'package:food_delivery/models/rest.dart';
import 'package:food_delivery/widgets/Food_item.dart';

class FoodListView extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  final Restaurant restaurant;
  const FoodListView(
      this.selected, this.callback, this.pageController, this.restaurant,
      {super.key});

  @override
  Widget build(BuildContext context) {
    final category = restaurant.menu.keys.toList();
    return Container(
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children: category
            .map((e) => ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) =>
                      FoodItem(restaurant.menu[category[selected]]![index]),
                  separatorBuilder: (_, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: restaurant.menu[category[selected]]!.length,
                ))
            .toList(),
      ),
    );
  }
}
