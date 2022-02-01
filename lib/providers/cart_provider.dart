import 'dart:math';

import 'package:booksella/models/cartitem.dart';
import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  // hold the items
  final Map<String, CartItem> _items = {
    'kafjhfjanfh': CartItem(
      id: 'kafjhfjanfh',
      bookName: "Digital Design",
      price: 250,
      imageUrl:
          "https://images-na.ssl-images-amazon.com/images/I/51JEKC1uRtL.jpg",
      quantity: 1,
    ),
    'faahklgflkag': CartItem(
      id: 'faahklgflkag',
      bookName: "Information Theory and Coding",
      price: 845,
      imageUrl: "https://www.e-booksdirectory.com/imglrg/1404.jpg",
      quantity: 2,
    ),
    'kflahfjajfhafa': CartItem(
      id: 'kflahfjajfhafa',
      bookName: "VLSI",
      price: 745,
      imageUrl:
          "https://rukminim1.flixcart.com/image/1664/1664/book/6/8/1/cmos-vlsi-design-original-imadg4yt2bnah4by.jpeg?q=90",
      quantity: 4,
    ),
  };

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
  ) {
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
  void deleteItem() {
    _items.clear();
    notifyListeners();
  }

  // remove the specific item from cart
  void removeItem(String carttId) {
    _items.removeWhere((key, value) => key == carttId);
    notifyListeners();
  }

  // increase and decrease the number number of particaular item in cart
  void increDecrementItemCount(bool val, String cartId) {
    if (val == true) {
      if (!_items.containsKey(cartId)) {
        return;
      } else if (_items[cartId]!.quantity >= 1) {
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
        _items.remove(cartId);
      }
    }
    notifyListeners();
  }
}
