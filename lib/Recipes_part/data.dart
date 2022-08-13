class Recipe {
  String title;
  String description;
  String image;
  int calories;
  int carbo;
  int protein;

  Recipe(this.title, this.description, this.image, this.calories, this.carbo,
      this.protein);
}

List<Recipe> getBreakfast() {
  return <Recipe>[
    Recipe(
      "Spyce kitchen",
      "So irresistibly delicious",
      "assets/images/breakfast_1.png",
      250,
      35,
      6,
    ),
    Recipe(
      "Salad",
      "True Italian classic with a meaty, chilli sauce",
      "assets/images/breakfast_2.png",
      200,
      45,
      10,
    ),
    Recipe(
      "Chickenni",
      "White Onion, Fennel, and watercress Salad",
      "assets/images/breakfast_3.png",
      190,
      35,
      12,
    ),
    Recipe(
      "Chicken salad",
      "Bacon-Wrapped Filet Mignon",
      "assets/images/breakfast_4.png",
      250,
      55,
      20,
    ),
    Recipe(
      "Avocado toast",
      "Crispy Garlic Roasted Potatoes",
      "assets/images/breakfast_5.png",
      150,
      30,
      8,
    ),
    Recipe(
      "Mix bowl",
      "Crispy Garlic Roasted Potatoes",
      "assets/images/breakfast_6.png",
      150,
      30,
      8,
    ),
  ];
}

List<Recipe> getLunch() {
  return <Recipe>[
    Recipe(
      "Brocchicken",
      "So irresistibly delicious",
      "assets/images/lunch_1.png",
      250,
      35,
      6,
    ),
    Recipe(
      "Grill chicken salad",
      "True Italian classic with a meaty, chilli sauce",
      "assets/images/lunch_2.png",
      200,
      45,
      10,
    ),
    Recipe(
      "Asparagus",
      "White Onion, Fennel, and watercress Salad",
      "assets/images/lunch_3.png",
      190,
      35,
      12,
    ),
    Recipe(
      "Filet Mignon",
      "Bacon-Wrapped Filet Mignon",
      "assets/images/lunch_4.png",
      250,
      55,
      20,
    ),
    Recipe(
      "Pasta Bolognese",
      "Crispy Garlic Roasted Potatoes",
      "assets/images/pasta_bolognese.png",
      150,
      30,
      8,
    ),
    Recipe(
      "Stack Potatoes",
      "Crispy Garlic Roasted Potatoes",
      "assets/images/filete_con_papas_cambray.png",
      150,
      30,
      8,
    ),
  ];
}

// dinner
List<Recipe> getRecipes() {
  return <Recipe>[
    Recipe(
      "Stack Potatoes",
      "Crispy Garlic Roasted Potatoes",
      "assets/images/dinner_4.png",
      150,
      30,
      8,
    ),
    Recipe(
      "Salmon Salad",
      "So irresistibly delicious",
      "assets/images/chicken_fried_rice.png",
      250,
      35,
      6,
    ),
    Recipe(
      "Pasta Bolognese",
      "True Italian classic with a meaty, chilli sauce",
      "assets/images/dinner_1.png",
      200,
      45,
      10,
    ),
    Recipe(
      "Asparagus",
      "White Onion, Fennel, and watercress Salad",
      "assets/images/asparagus.png",
      190,
      35,
      12,
    ),
    Recipe(
      "Filet Mignon",
      "Bacon-Wrapped Filet Mignon",
      "assets/images/dinner_3.png",
      250,
      55,
      20,
    ),
  ];
}
