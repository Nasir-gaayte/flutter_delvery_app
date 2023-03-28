import 'package:food_delivery/models/food.dart';

class Restaurant {
  String name;
  String waitTime;
  String distance;
  String label;
  String logoUrl;
  String desc;
  num score;
  Map<String, List<Food>> menu;
  Restaurant(this.name, this.waitTime, this.distance, this.label, this.logoUrl,
      this.desc, this.score, this.menu);
  static Restaurant genrateRe() {
    return Restaurant(
      'Kali',
      '20-30 min',
      '2kg',
      'fastfood',
      'assets/images/cake2.jpg',
      'not have but can make your day',
      5,
      {
        'Recmanded': Food.generateRecommendFoods(),
        'Popular': Food.generateRecommendFoods(),
        'waite': Food.generateRecommendFoods(),
        'juse': [],
        'pizza': [],
      },
    );
  }
}
