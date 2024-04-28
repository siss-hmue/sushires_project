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
    ],
  ),
  // Add more categories as needed
];