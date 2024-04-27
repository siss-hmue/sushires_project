import 'package:flutter/material.dart';
import 'package:sushires_project/components/appbackground.dart';

import 'CartPage.dart';
import 'cartitem.dart';
import 'menuitem.dart';

class MenuItemPage extends StatefulWidget {
  final MenuItem menuItem;

  MenuItemPage({required this.menuItem});

  @override
  _MenuItemPageState createState() => _MenuItemPageState();
}

class _MenuItemPageState extends State<MenuItemPage> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.menuItem.name,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Color(0xFFF8774A).withOpacity(0.8),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
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
      body: SafeArea(
        child: AppBackGround(
          childWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200, // Adjust height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.menuItem.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.menuItem.name,
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      widget.menuItem.description,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            if (_quantity > 0) {
                              setState(() {
                                _quantity--;
                              });
                            }
                          },
                        ),
                        Text(
                          '$_quantity',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              _quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.brown),
                      ),
                      onPressed: () {
                        // Add the selected item to cart
                        if (_quantity > 0) {
                          _addToCart(context, widget.menuItem, _quantity);
                        }
                      },
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addToCart(BuildContext context, MenuItem item, int quantity) {
    // Add item to cart
    // This implementation may vary based on your specific cart logic
    for (int i = 0; i < quantity; i++) {
      int index =
          cartItems.indexWhere((cartItem) => cartItem.item.name == item.name);

      if (index != -1) {
        // Item already exists in the cart, increase its quantity
        cartItems[index].quantity++;
      } else {
        // Item doesn't exist in the cart, add it
        cartItems.add(CartItem(item: item));
      }
    }

    // Show a snackbar to indicate item added to cart
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.name} added to cart'),
        duration: Duration(seconds: 1),
      ),
    );

    // Reset quantity to 0 after adding to cart
    setState(() {
      _quantity = 0;
    });
  }
}
