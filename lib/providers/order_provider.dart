import 'package:booksella/models/cartitem.dart';
import 'package:booksella/models/orderitem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'dart:convert';
import 'package:intl/intl.dart';

class Order with ChangeNotifier {
  List<OrderItem> _myOrders = [];

  // get the order
  List<OrderItem> get myOrders {
    return [..._myOrders];
  }

  // randomly genrate a 12 digit string
  String genrateRandomString(int length) {
    return String.fromCharCodes(
        List.generate(length, (index) => Random().nextInt(33) + 89));
  }

  // fetch the data from database
  Future<void> fetchOrders() async {
    final _rootRef = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    QuerySnapshot<Map<String, dynamic>> orderData =
        await _rootRef.collection("orders").get();
    List<OrderItem> tempList = [];
    for (var i = 0; i < orderData.docs.length; i++) {
      var orderedProd = await _rootRef
          .collection("orders")
          .doc("order$i")
          .collection("orderedProducts")
          .get();
      // aceess the orderd products
      List<CartItem> tempOrderedList = [];
      for (var j = 0; j < orderedProd.docs.length; j++) {
        tempOrderedList.add(CartItem(
            id: orderedProd.docs[j]["id"],
            imageUrl: orderedProd.docs[j]["imageUrl"],
            bookName: orderedProd.docs[j]["bookName"],
            price: orderedProd.docs[j]["price"],
            quantity: orderedProd.docs[j]["quantity"]));
      }
      print(tempOrderedList);
      // add the orderitem
      tempList.add(OrderItem(
        id: genrateRandomString(12).toUpperCase(),
        ammount: orderData.docs[i]["ammount"],
        orderedProducts: tempOrderedList,
        date: orderData.docs[i]["date"].toDate(),
        orderStatus: orderData.docs[i]["orderStatus"],
      ));
    }
    _myOrders = tempList;
    notifyListeners();
  }

  // add order to my orders
  void addOrders(
    int ammount,
    List<CartItem> orderedProducts,
    DateTime date,
    String orderStatus,
  ) async {
    // List tempList = [];
    // List firbaseList() {
    //   return orderedProducts;
    // }

    final _instance = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("orders");
    final ordersRef = await _instance.get();
    final listLength = ordersRef.docs.length;
    await _instance.doc("order$listLength").set({
      "ammount": ammount,
      "date": date,
      "orderStatus": orderStatus,
    });

    for (int i = 0; i < orderedProducts.length; i++) {
      await _instance
          .doc("order$listLength")
          .collection("orderedProducts")
          .add({
        'id': orderedProducts[i].id,
        'imageUrl': orderedProducts[i].imageUrl,
        'bookName': orderedProducts[i].bookName,
        'price': orderedProducts[i].price,
        'quantity': orderedProducts[i].quantity,
      });
    }
    _myOrders.add(OrderItem(
      id: genrateRandomString(12).toUpperCase(),
      ammount: ammount,
      orderedProducts: orderedProducts,
      date: date,
      orderStatus: orderStatus,
    ));
    notifyListeners();
  }
}
