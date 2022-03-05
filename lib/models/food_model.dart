part of 'models.dart';

enum FoodType { new_food, popular, recomended }

class Food extends Equatable {
  final int id;
  final String pictureFood;
  final String nameFood;
  final String deskripsiFood;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> types;

  Food(
      {this.id,
      this.pictureFood,
      this.nameFood,
      this.deskripsiFood,
      this.ingredients,
      this.price,
      this.rate,
      this.types = const []});

  @override
  List<Object> get props =>
      [id, pictureFood, nameFood, deskripsiFood, ingredients, price, rate];
}

List<Food> mockFood = [
  Food(
      id: 0,
      pictureFood:
          "https://p4.wallpaperbetter.com/wallpaper/932/54/455/hamburger-french-fries-fast-food-wallpaper-preview.jpg",
      nameFood: "Burger King",
      deskripsiFood: "Burger berlapis beef tebal berbalur keju, rasanya gurih gurih nyoi, berukuran sangat besar besar kali sangan mantap",
      ingredients: "Keju, daging, bawang merah, mayones",
      price: 1200000,
      rate: 3,
      types: [FoodType.new_food, FoodType.popular, FoodType.recomended]),
  Food(
      id: 1,
      pictureFood:
          "https://p4.wallpaperbetter.com/wallpaper/932/54/455/hamburger-french-fries-fast-food-wallpaper-preview.jpg",
      nameFood: "Burger King",
      deskripsiFood:
          "Burger berlapis beef tebal berbalur keju, rasanya gurih gurih nyoi, berukuran sangat besar besar kali sangan mantap",
      ingredients: "Keju, daging, bawang merah, mayones",
      price: 1200000,
      rate: 3),
  Food(
      id: 2,
      pictureFood:
          "https://p4.wallpaperbetter.com/wallpaper/932/54/455/hamburger-french-fries-fast-food-wallpaper-preview.jpg",
      nameFood: "Burger King",
      deskripsiFood: "Burger berlapis beef tebal berbalur keju, rasanya gurih gurih nyoi, berukuran sangat besar besar kali sangan mantap",
      ingredients: "Keju, daging, bawang merah, mayones",
      price: 1200000,
      rate: 3,
      types: [FoodType.new_food]),
  Food(
      id: 3,
      pictureFood:
          "https://p4.wallpaperbetter.com/wallpaper/932/54/455/hamburger-french-fries-fast-food-wallpaper-preview.jpg",
      nameFood: "Burger Smal",
      deskripsiFood:
          "Burger berlapis beef tebal berbalur keju, rasanya gurih gurih nyoi, berukuran sangat besar besar kali sangan mantap",
      ingredients: "Keju, daging, bawang merah, mayones",
      price: 1200000,
      rate: 3)
];
