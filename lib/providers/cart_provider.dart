import 'dart:math';

import 'package:booksella/models/cartitem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  // hold the items
  Map<String, CartItem> _items = {};

  // get the cart items
  Map<String, CartItem> get items {
    return {..._items};
  }

  // get the total ammount in cart
  int get totalAmount {
    int total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // get the cartitems from database
  void fetchCartItems() async {
    QuerySnapshot<Map<String, dynamic>> cartData;
    cartData = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("CartItem")
        .get();
    // create a map using cartData
    Map<String, CartItem> cartItemsForParticularUser = {};
    for (var i = 0; i < cartData.docs.length; i++) {
      cartItemsForParticularUser[cartData.docs[i].id] = CartItem(
          id: cartData.docs[i].id,
          imageUrl: cartData.docs[i]["imageUrl"],
          bookName: cartData.docs[i]["bookName"],
          price: cartData.docs[i]["price"],
          quantity: cartData.docs[i]["quantity"]);
    }
    _items = cartItemsForParticularUser;
    notifyListeners();
  }

  // function to create a random cart ID
  String genrateRandomString(int length) {
    return String.fromCharCodes(
        List.generate(length, (index) => Random().nextInt(33) + 89));
  }

  // add product to the cart
  void addProductToCart(
    String bookname,
    int price,
    String imageUrl,
    int quantity,
  ) async {
    var _instance = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("CartItem")
        .doc(bookname);
    await _instance.set({
      'id': _instance.id,
      'imageUrl': imageUrl,
      'bookName': bookname,
      'price': price,
      'quantity': quantity,
    });
    CartItem _product = CartItem(
      id: genrateRandomString(12),
      imageUrl: imageUrl,
      bookName: bookname,
      price: price,
      quantity: quantity,
    );
    _items[_product.id] = _product;
    notifyListeners();
  }

  // delete all the items in cart
  void deleteItem() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("CartItem")
        .get()
        .then((snapshot) {
      for (var document in snapshot.docs) {
        document.reference.delete();
      }
    });
    _items.clear();
    notifyListeners();
  }

  // remove the specific item from cart
  void removeItem(String carttId) {
    _items.removeWhere((key, value) => key == carttId);
    notifyListeners();
  }

  // increase and decrease the number number of particaular item in cart
  void increDecrementItemCount(bool val, String cartId) async {
    var _instance = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("CartItem");
    if (val == true) {
      if (!_items.containsKey(cartId)) {
        return;
      } else if (_items[cartId]!.quantity >= 1) {
        await _instance.doc(_items[cartId]!.bookName).update(
            <String, dynamic>{"quantity": _items[cartId]!.quantity + 1});
        _items.update(
          cartId,
          (existingValue) => CartItem(
            id: existingValue.id,
            imageUrl: existingValue.imageUrl,
            bookName: existingValue.bookName,
            price: existingValue.price,
            quantity: existingValue.quantity + 1,
          ),
        );
      }
    } else if (val == false) {
      if (!_items.containsKey(cartId)) {
        return;
      } else if (_items[cartId]!.quantity > 1) {
        await _instance.doc(_items[cartId]!.bookName).update(
            <String, dynamic>{"quantity": _items[cartId]!.quantity - 1});
        _items.update(
          cartId,
          (existingValue) => CartItem(
            id: existingValue.id,
            imageUrl: existingValue.imageUrl,
            bookName: existingValue.bookName,
            price: existingValue.price,
            quantity: existingValue.quantity - 1,
          ),
        );
      } else {
        await _instance.doc(_items[cartId]!.bookName).delete();
        _items.remove(cartId);
      }
    }
    notifyListeners();
  }

  // get the details for the user
  Future<dynamic> phoneNumber(String get) async {
    var userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    var phone = userData.data()!["phone-no."];
    var email = userData.data()!["email"];

    if (get == "phone") {
      return phone;
    } else if (get == "email") {
      return email;
    }
    return 0;
  }
}
