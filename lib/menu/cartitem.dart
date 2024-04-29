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
          description: "avocado, cucumber, and imitation crab,rolled with sushi rice and seaweed.",
          price: 60,
          imagePath: "images/CaliforniaRolls.png"),
      MenuItem(
          name: "Eel Nigiri",
          description: "Freshwater eel glazed with sweet teriyaki sauce",
          price: 75,
          imagePath: "images/EelNigiri.png"),
      MenuItem(
          name: "Eel Roll",
          description: " (freshwater eel) glazed with sweet teriyaki sauce, creamy avocado, and cucumber",
          price: 85,
          imagePath: "images/EelRoll.png"),
      MenuItem(
          name: "Rainbow Dragon Roll",
          description: "shrimp tempura, cucumber, avocado, and a variety of fresh fish",
          price: 95,
          imagePath: "images/RainbowDragonRoll.png"),
      MenuItem(
          name: "Salmon Nigiri",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 105,
          imagePath: "images/SalmonNigiri.jpg"),
      MenuItem(
          name: "Salmon Sashimi",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 85,
          imagePath: "images/SalmonSashimi.png"),
      MenuItem(
          name: "Salmon temaki",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 95,
          imagePath: "images/SalmonTemaki.png"),
      MenuItem(
          name: "Sashimi Bundle",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 85,
          imagePath: "images/SashimiBundle.png"),
      MenuItem(
          name: "ShrimpTempura",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 95,
          imagePath: "images/ShrimpTempura.png"),
      MenuItem(
          name: "Spicy Salmon Roll",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 100,
          imagePath: "images/SpicySalmonRoll.png"),
      MenuItem(
          name: "Spider Roll",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 95,
          imagePath: "images/SpiderRoll.png"),
      MenuItem(
          name: "Temaki",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 60,
          imagePath: "images/Temaki.png"),
      MenuItem(
          name: "Tuna Nigiri",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 95,
          imagePath: "images/TunaNigiri.png"),
      MenuItem(
          name: "Tuna Sashimi",
          description: "Steamed soybeans sprinkled with sea salt.",
          price: 130,
          imagePath: "images/TunaSashimi.png"),
      MenuItem(
          name: "Uni Nigiri",
          description: "Creamy and sweet flavor of uni",
          price: 200,
          imagePath: "images/UniNigiri.png"),
      MenuItem(
          name: "Vegas Roll",
          description: "made with shrimp tempura, cucumber, avocado and flying fish roe",
          price: 90,
          imagePath: "images/VegasRoll.png"),
      MenuItem(
          name: "Yellow Tail Nigiri",
          description: "made with buttery yellow tail (a rich, sweet flavor)",
          price: 110,
          imagePath: "images/YellowTailNigiri.png"),
      MenuItem(
          name: "Yellow Tail Sashimi",
          description: "decorated with thin slices of buttery yellow tail",
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
          description: "Crispy fried tofu cubes served with scallions and ginger",
          price: 75,
          imagePath: "images/AgedashiTofu.png"),
      MenuItem(
          name: "Vege Tempura",
          description: "deeply fried  seasonal vegetables to crispy perfection",
          price: 100,
          imagePath: "images/VegeTempura.png"),
    ],
  ),
  // Add more categories as needed
];
