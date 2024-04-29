import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static Future<void> addToReadyToPickup(String orderNumber) async {
    // Add orderNumber to the ReadyToPickUp collection
    await FirebaseFirestore.instance
        .collection('ReadyToPickUp')
        .doc(orderNumber)
        .set({
      'orderNumber': orderNumber,
    });
  }

  static Future<void> deleteFromTempOrder(String orderNumber) async {
    // Query the tempOrder collection to find the document ID
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('tempOrder')
        .where('orderNumber', isEqualTo: orderNumber)
        .get();

    // Check if any documents match the query
    if (querySnapshot.docs.isNotEmpty) {
      // Get the document ID of the first matching document
      String documentId = querySnapshot.docs.first.id;

      // Delete the document from the tempOrder collection
      await FirebaseFirestore.instance
          .collection('tempOrder')
          .doc(documentId)
          .delete();
    } else {
      print('No document found with orderNumber: $orderNumber');
    }
  }
}
