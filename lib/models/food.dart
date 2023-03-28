class Food {
  String imgUrl;
  String desc;
  String name;
  String waitTime;
  num score;
  String cal;
  num price;
  num qty;
  List<Map<String, String>> ingred;
  String about;
  bool hightLight;
  Food(this.imgUrl, this.desc, this.name, this.waitTime, this.score, this.cal,
      this.price, this.qty, this.ingred, this.about,
      {this.hightLight = false});
  static List<Food> generateRecommendFoods() {
    return [
      Food(
          'assets/images/p1.jpeg',
          'no1 in sales',
          'big mak',
          '50 min',
          5,
          '325 borg',
          5,
          6,
          [
            {'brad': 'assets/images/p2.jpeg'},
            {'meet': 'assets/images/p4.jpeg'}
          ],
          'the best in the market',
          hightLight: true),
      Food(
          'assets/images/p2.jpeg',
          'daily sales',
          'chiken wings',
          '50 min',
          4.5,
          '410 borg',
          10,
          12,
          [
            {'brad': 'assets/images/p4.jpeg'},
            {'meet': 'assets/images/p1.jpeg'}
          ],
          'the best in the market',
          hightLight: false)
    ];
  }
}
