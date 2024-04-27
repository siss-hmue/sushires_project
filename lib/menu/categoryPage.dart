import 'package:flutter/material.dart';

import 'cartPage.dart';
import 'cartitem.dart';
import 'menucategory.dart';
import 'menuitem.dart';
import 'menuitempage.dart';

class CategoryPage extends StatelessWidget {
  final MenuCategory menuCategory;

  CategoryPage({required this.menuCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuCategory.name),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the cart page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          mainAxisSpacing: 8.0, // Spacing between items along the main axis
          crossAxisSpacing: 8.0, // Spacing between items along the cross axis
        ),
        itemCount: menuCategory.items.length,
        itemBuilder: (context, index) {
          final menuItem = menuCategory.items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuItemPage(menuItem: menuItem),
                ),
              );
            },
            child: Card(
              elevation: 2.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(menuItem.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menuItem.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        //Text(menuItem.description),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _addToCart(BuildContext context, MenuItem item) {
    // Check if the item is already in the cart
    int index =
        cartItems.indexWhere((cartItem) => cartItem.item.name == item.name);

    if (index != -1) {
      // Item already exists in the cart, increase its quantity
      cartItems[index].quantity++;
    } else {
      // Item doesn't exist in the cart, add it
      cartItems.add(CartItem(item: item));
    }

    // Show a snackbar to indicate item added to cart
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.name} added to cart'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
