// Define a class to represent an item in the cart
import 'menucategory.dart';
import 'menuitem.dart';

class CartItem {
  final MenuItem item;
  int quantity;

  CartItem({required this.item, this.quantity = 1});
}

// Define a list to hold cart items
List<CartItem> cartItems = [];

// Define a list of sample menu categories and items
List<MenuCategory> menuCategories = [
  MenuCategory(
    name: "Sushi",
    //description: "Start your meal with delicious appetizers.",
    items: [
      MenuItem(
        name: "Spring Rolls",
        description: "Crispy spring rolls filled with vegetables.",
        price: 7,
        imagePath: "images/caliroll.png",
      ),
      MenuItem(
          name: "Crunchy Roll",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 5,
          imagePath: "images/crunchyroll.png"),
      MenuItem(
          name: "California Roll",
          description: "takhu khu yayy",
          price: 60,
          imagePath: "images/CaliforniaRolls.png"),
      MenuItem(
          name: "Eel Nigiri",
          description: "takhu khu yay pay",
          price: 75,
          imagePath: "images/EelNigiri.png"),
      MenuItem(
          name: "Eel Roll",
          description: "takhu khu yay",
          price: 85,
          imagePath: "images/EelRoll.png"),
      MenuItem(
          name: "Rainbow Dragon Roll",
          description: "takhu khu yayy",
          price: 95,
          imagePath: "images/RainbowDragonRoll.png"),
      MenuItem(
          name: "Salmon Nigiri",
          description: "Delicate Salmon on Sushi Rice",
          price: 105,
          imagePath: "images/SalmonNigiri.jpg"),
      MenuItem(
          name: "Salmon Sashimi",
          description: "Fresh and sweet slices of Salmon",
          price: 85,
          imagePath: "images/SalmonSashimi.png"),
      MenuItem(
          name: "Salmon Temaki",
          description: "fresh salmon and creamy avocado wrapped in seaweed with sushi rice",
          price: 95,
          imagePath: "images/SalmonTemaki.png"),
      MenuItem(
          name: "Sashimi Bundle",
          description: "Fresh & delicate slices of salmon, tuna, yellowtail, maguro and hamachi.",
          price: 85,
          imagePath: "images/SashimiBundle.png"),
      MenuItem(
          name: "ShrimpTempura",
          description: "Crispy and sweet shrimp deep-fried in sesame oil for better flavor.",
          price: 95,
          imagePath: "images/ShrimpTempura.png"),
      MenuItem(
          name: "Spicy Salmon Roll",
          description: "Spicy tuna salad, cucumber, and avocado,in sushi rice and seaweed.",
          price: 100,
          imagePath: "images/SpicySalmonRoll.png"),
      MenuItem(
          name: "Spider Roll",
          description: "Soft-shell crabcucumber, avocado, and spicy mayo,in sushi rice and seaweed.",
          price: 95,
          imagePath: "images/SpiderRoll.png"),
      MenuItem(
          name: "Temaki",
          description: "Crispy tempura shrimp, cucumber and creamy avocado wrapped in a seaweed.",
          price: 60,
          imagePath: "images/Temaki.png"),
      MenuItem(
          name: "Tuna Nigiri",
          description: "Delicate slice of Tuna on Sushi Rice",
          price: 95,
          imagePath: "images/TunaNigiri.png"),
      MenuItem(
          name: "Tuna Sashimi",
          description: "Fresh and delicate slices of Tuna",
          price: 130,
          imagePath: "images/TunaSashimi.png"),
      MenuItem(
          name: "Uni Nigiri",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 200,
          imagePath: "images/UniNigiri.png"),
      MenuItem(
          name: "Vegas Roll",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 90,
          imagePath: "images/VegasRoll.png"),
      MenuItem(
          name: "Yellow Tail Nigiri",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 110,
          imagePath: "images/YellowTailNigiri.png"),
      MenuItem(
          name: "Yellow Tail Sashimi",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 150,
          imagePath: "images/YellowTailSashimi.png"),
      // Add more items as needed
    ],
  ),
  MenuCategory(
    name: 'Soups',
    items: [
      MenuItem(
          name: 'Misosoup',
          description:
              'A light broth made with dashi (kombu and bonito flakes), miso paste, tofu, and seaweed.',
          price: 15,
          imagePath: "images/miso.png"),
      MenuItem(
          name: 'Clear Broth',
          description:
              'This is a simple yet flavorful broth made with dashi (kombu and bonito flakes) and flavored with scallions or mushrooms',
          price: 10,
          imagePath: "images/clearbroth.png"),
    ],
  ),
  MenuCategory(
    name: 'Beverages',
    items: [
      MenuItem(
          name: 'Sake',
          description:
              'A light, fermented rice wine that pairs well with sushi.',
          price: 9,
          imagePath: "images/sake.png"),
      MenuItem(
          name: 'Japanese Green Tea',
          description: 'An authentic green tea',
          price: 12,
          imagePath: "images/japangreentea.png"),
      MenuItem(
          name: 'Plum Wine(Umeshu)',
          description: 'This is a sweet and tart liqueur made from ume plums',
          price: 10,
          imagePath: "images/redplumwine.png"),
      MenuItem(
          name: 'Ocha Tea',
          description:
              'A light, fermented rice wine that pairs well with sushi.',
          price: 0,
          imagePath: "images/OchaTea.jpeg"),
    ],
  ),
  MenuCategory(
    name: "Others",
    items: [
      MenuItem(
          name: 'Gyoza',
          description:
              "Crispy on the outside, tender and flavorful on the inside",
          price: 75,
          imagePath: "images/Gyoza.png"),
      MenuItem(
          name: 'Agedashi Tofu',
          description: "Palate cleansing Flavor of sweet and savory Tofu",
          price: 75,
          imagePath: "images/AgedashiTofu.png"),
      MenuItem(
          name: "Vege Tempura",
          description: "Fresh Vegetables Deep Fried in sesame oil",
          price: 100,
          imagePath: "images/VegeTempura.png"),
    ],
  ),
  // Add more categories as needed
];
