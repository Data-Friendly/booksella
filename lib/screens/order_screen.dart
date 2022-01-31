import 'package:booksella/providers/order_provider.dart';
import 'package:booksella/widgets/order_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const routeName = "/order-screen";

  @override
  Widget build(BuildContext context) {
    var totalHeight = MediaQuery.of(context).size.height;
    var totalWidth = MediaQuery.of(context).size.width;
    final orderitems = Provider.of<Order>(context);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Container(
          margin: EdgeInsets.fromLTRB(0, 0, totalWidth * 0.12, 0),
          child: const Center(
            child: Text(
              "My Orders",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: orderitems.myOrders.length,
              itemBuilder: (ctx, index) {
                return OrderDisplay(myOrder: orderitems.myOrders[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
