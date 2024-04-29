import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cartitem.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendOrderToKitchen(List cartItems) async {
    // Generate a random order number
    String orderNumber = _generateOrderNumber();

    // Prepare order data
    Map<String, dynamic> orderData = {
      'orderNumber': orderNumber,
      'items': cartItems.map((cartItem) {
        return {
          'itemName': cartItem.item.name,
          'quantity': cartItem.quantity,
          'price': cartItem.item.price,
        };
      }).toList(),
      'totalAmount': _calculateTotal(cartItems),
    };

    // Save order data to Firestore
    await _firestore.collection('orders').doc().set(orderData);
    await _firestore.collection('tempOrder').doc().set(orderData);
  }

  double _calculateTotal(List cartItems) {
    double total = 0;
    for (CartItem cartItem in cartItems) {
      total += cartItem.item.price * cartItem.quantity;
    }
    return total;
  }

  String _generateOrderNumber() {
    final random = Random();
    String initials = 'HS'; // Your initials
    String randomNumber = '';

    // Generate a random 5-digit number string
    for (int i = 0; i < 5; i++) {
      randomNumber += random.nextInt(10).toString();
    }

    return '$initials$randomNumber';
  }
}
