import 'dart:math';

import 'package:booksella/models/orderitem.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDisplay extends StatefulWidget {
  final OrderItem myOrder;
  const OrderDisplay({Key? key, required this.myOrder}) : super(key: key);

  @override
  State<OrderDisplay> createState() => _OrderDisplayState();
}

class _OrderDisplayState extends State<OrderDisplay> {
  bool _expanded = true;
  Widget StatusText(String status, Color textcolor, double fontsize) => Text(
        status,
        style: TextStyle(fontSize: fontsize, color: textcolor),
      );

  @override
  Widget build(BuildContext context) {
    var totalHeight = MediaQuery.of(context).size.height;
    var totalWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: totalHeight * 0.01),
        child: Card(
          margin:
              EdgeInsets.fromLTRB(totalWidth * 0.02, 0, totalWidth * 0.02, 0),
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // order Id
              Container(
                margin: EdgeInsets.fromLTRB(
                  totalWidth * 0.04,
                  totalHeight * 0.015,
                  0,
                  totalHeight * 0.005,
                ),
                child: Row(
                  children: [
                    const Text(
                      "Order ID # ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.myOrder.id,
                      style: const TextStyle(color: Colors.black, fontSize: 17),
                    ),
                  ],
                ),
              ),
              // order status
              Container(
                margin: EdgeInsets.fromLTRB(
                  totalWidth * 0.04,
                  totalHeight * 0.015,
                  totalWidth * 0.04,
                  totalHeight * 0.005,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // name of field
                    const Text(
                      "Order Status :",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (widget.myOrder.orderStatus == "delivered")
                      StatusText('Deliverd',
                          const Color.fromRGBO(0, 176, 135, 10), 17),
                    if (widget.myOrder.orderStatus == "cancelled")
                      StatusText('Cancelled', Colors.red, 17),
                    if (widget.myOrder.orderStatus == "yetToDeliver")
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Track Order",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange[900],
                        ),
                      ),
                  ],
                ),
              ),
              // Date of the order
              Container(
                margin: EdgeInsets.fromLTRB(
                  totalWidth * 0.04,
                  0,
                  totalWidth * 0.04,
                  totalHeight * 0.005,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Order Date :",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat("dd/MM/yyyy hh:mm")
                          .format(widget.myOrder.date),
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
              // total price
              Container(
                margin: EdgeInsets.fromLTRB(
                  totalWidth * 0.04,
                  0,
                  totalWidth * 0.04,
                  totalHeight * 0.015,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total Price :",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\u{20B9}${widget.myOrder.ammount.toString()}",
                      style: const TextStyle(
                          color: Color.fromRGBO(0, 176, 135, 10),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              if (_expanded)
                Container(
                  margin: EdgeInsets.fromLTRB(
                    totalWidth * 0.04,
                    totalHeight * 0.015,
                    totalWidth * 0.04,
                    totalHeight * 0.005,
                  ),
                  width: totalWidth * 0.9,
                  height:
                      min(widget.myOrder.orderedProducts.length * 20 + 40, 100),
                  child: ListView(
                    children: widget.myOrder.orderedProducts
                        .map(
                          (book) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // book name
                              Text(
                                book.bookName,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              // book price and quantity
                              Text(
                                "${book.quantity} x \u{20B9}${book.price}",
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromRGBO(0, 176, 135, 10),
                                ),
                              )
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
