import 'package:flutter/material.dart';
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
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          CartItem cartItem = cartItems[index];

          return ListTile(
            title: Row(
              children: [
                Text(cartItem.item.name),
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
            subtitle:
                Text('Price: \$${cartItem.item.price.toStringAsFixed(2)}'),
            trailing: Text(
                'Total: \$${(cartItem.item.price * cartItem.quantity).toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.blue,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total: \$${total.toStringAsFixed(2)}',
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
              child: Text('Send to Kitchen'),
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