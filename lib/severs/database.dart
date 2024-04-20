import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  //this method will be called when the user clicked save reservation and we will pass a string dynamic(String dynamic help to upload the userform to the firestore easily)
  //in the string we will pass name, contact number,
  //in the dynamic method we can pass anything String, integer, boolean characters etc
  Future addCustomerReservation(
      Map<String, dynamic> customerInfoMap, String id) async {
    // String ID, there will be a specific id for each document that we will upload to the firestore database, so that we can update, delete specific customer reservation details from our app easily
    return await FirebaseFirestore.instance
        .collection("Customer")
        .doc(id)
        .set(customerInfoMap); //set method to upload userInfoMap
  }

  Future<Stream<QuerySnapshot>> getCustomerDetails() async {
    return await FirebaseFirestore.instance.collection("Customer").snapshots();
  }

  // when you want to show the documents from the firestore, always use a stream builder
  // get customer reservation details
  //update
  Future updateCustomerDetails(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Customer")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteCustomerDetails(String id) async {
    return await FirebaseFirestore.instance
        .collection("Customer")
        .doc(id)
        .delete();
  }
}
