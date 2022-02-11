import 'package:booksella/providers/order_provider.dart';
import 'package:booksella/widgets/order_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const routeName = "/order-screen";

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool _isLoading = true;
  bool _init = true;
  @override
  void didChangeDependencies() async {
    if (_init) {
      await Provider.of<Order>(context, listen: false).fetchOrders();
    }
    setState(() {
      _isLoading = false;
    });
    _init = false;
    super.didChangeDependencies();
  }

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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
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
