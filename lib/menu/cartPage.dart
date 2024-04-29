import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sushires_project/components/appbackground.dart';
import 'cartitem.dart';
import 'databaseMenu.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double total = _calculateTotal();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFF8774A).withOpacity(0.8),
      ),
      body: AppBackGround(
        childWidget: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            CartItem cartItem = cartItems[index];

            return ListTile(
              title: Row(
                children: [
                  Text(
                    cartItem.item.name,
                    //overflow: TextOverflow.clip,
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      _decreaseQuantity(index);
                    },
                  ),
                  Text('${cartItem.quantity}'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      _increaseQuantity(index);
                    },
                  ),
                ],
              ),
              //subtitle:
              // Text('Price: ${cartItem.item.price.toStringAsFixed(2)} Baht'),
              //trailing: Text(
              //'Total: ${(cartItem.item.price * cartItem.quantity).toStringAsFixed(2)} Baht'),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.brown,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total: ${total.toStringAsFixed(2)} Baht',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                DatabaseService().sendOrderToKitchen(cartItems);
                // Clear cart after sending order
                setState(() {
                  cartItems.clear();
                });
                // Show a snackbar to indicate order sent
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Order sent to kitchen'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Text(
                'Send To Kitchen',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateTotal() {
    double total = 0;
    for (CartItem cartItem in cartItems) {
      total += cartItem.item.price * cartItem.quantity;
    }
    return total;
  }

  void _increaseQuantity(int index) {
    setState(() {
      cartItems[index].quantity++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index].quantity > 0) {
        cartItems[index].quantity--;
      }
      if (cartItems[index].quantity == 0) {
        cartItems.removeAt(index);
      }
    });
  }
}
