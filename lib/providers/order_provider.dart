import 'package:booksella/models/cartitem.dart';
import 'package:booksella/models/orderitem.dart';
import 'package:flutter/cupertino.dart';

class Order with ChangeNotifier {
  final List<OrderItem> _myOrders = [
    OrderItem(
      id: 'HACABHDUNFJZN',
      ammount: 4920,
      orderedProducts: [
        CartItem(
          id: 'kafjhfjanfh',
          bookName: "Digital Design",
          price: 250,
          imageUrl:
              "https://images-na.ssl-images-amazon.com/images/I/51JEKC1uRtL.jpg",
          quantity: 1,
        ),
        CartItem(
          id: 'faahklgflkag',
          bookName: "Information Theory and Coding",
          price: 845,
          imageUrl: "https://www.e-booksdirectory.com/imglrg/1404.jpg",
          quantity: 2,
        ),
      ],
      date: DateTime.now(),
      orderStatus: OrderStatus.delivered,
    ),
    OrderItem(
      id: 'HSDFBSBDFIUAH',
      ammount: 2347,
      orderedProducts: [
        CartItem(
          id: 'kafjhfjanfh',
          bookName: "Digital Design",
          price: 250,
          imageUrl:
              "https://images-na.ssl-images-amazon.com/images/I/51JEKC1uRtL.jpg",
          quantity: 3,
        ),
        CartItem(
          id: 'faahklgflkag',
          bookName: "Information Theory and Coding",
          price: 845,
          imageUrl: "https://www.e-booksdirectory.com/imglrg/1404.jpg",
          quantity: 1,
        ),
      ],
      date: DateTime.now(),
      orderStatus: OrderStatus.yetToDeliver,
    ),
    OrderItem(
      id: 'UITNHHRUHTGNO',
      ammount: 400,
      orderedProducts: [
        CartItem(
          id: 'kafjhfjanfh',
          bookName: "Digital Design",
          price: 250,
          imageUrl:
              "https://images-na.ssl-images-amazon.com/images/I/51JEKC1uRtL.jpg",
          quantity: 1,
        ),
        CartItem(
          id: 'faahklgflkag',
          bookName: "Information Theory and Coding",
          price: 150,
          imageUrl: "https://www.e-booksdirectory.com/imglrg/1404.jpg",
          quantity: 1,
        ),
      ],
      date: DateTime.now(),
      orderStatus: OrderStatus.cancelled,
    )
  ];

  List<OrderItem> get myOrders {
    return [..._myOrders];
  }
}
