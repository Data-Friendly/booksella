import 'package:booksella/models/cartitem.dart';
import 'package:booksella/models/orderitem.dart';
import 'package:booksella/providers/cart_provider.dart';
import 'package:booksella/providers/order_provider.dart';
import 'package:booksella/widgets/cart_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = "/cart_screen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isinit = true;
  bool _isloading = true;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isinit) {
      Provider.of<Cart>(context, listen: false).fetchCartItems();
    }
    setState(() {
      _isloading = false;
    });
    _isinit = false;
    // did change dipendencies run many times we do not want that shit to happen

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var totalHeight = MediaQuery.of(context).size.height;
    var totalWidth = MediaQuery.of(context).size.width;
    final cartitems = Provider.of<Cart>(context);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        toolbarHeight: 70,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Center(
          child: Text(
            "Cart",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              cartitems.deleteItem();
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : cartitems.items.isEmpty
              ? const Center(
                  child: Text(
                    "No Items Added Yet !",
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: cartitems.items.length,
                          itemBuilder: (ctx, index) {
                            return CartDisplay(
                              id: cartitems.items.values.toList()[index].id,
                              imageUrl: cartitems.items.values
                                  .toList()[index]
                                  .imageUrl,
                              bookName: cartitems.items.values
                                  .toList()[index]
                                  .bookName,
                              price:
                                  cartitems.items.values.toList()[index].price,
                              quantity: cartitems.items.values
                                  .toList()[index]
                                  .quantity,
                            );
                          }),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      height: totalHeight * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // total ammount
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: totalWidth * 0.07,
                                    top: totalHeight * 0.03),
                                child: const Text(
                                  "Total",
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    right: totalWidth * 0.07,
                                    top: totalHeight * 0.03),
                                child: Text(
                                  "\u{20B9}${cartitems.totalAmount}",
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.grey,
                            indent: 25,
                            endIndent: 25,
                          ),
                          // button to the payment page
                          Container(
                            margin: EdgeInsets.only(bottom: totalHeight * 0.03),
                            width: totalWidth * 0.89,
                            height: totalHeight * 0.05,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.orange[900]),
                              onPressed: () {
                                Provider.of<Order>(context, listen: false)
                                    .addOrders(
                                  cartitems.totalAmount,
                                  cartitems.items.values.toList(),
                                  DateTime.now(),
                                  "yetToDeliver",
                                );
                                cartitems.deleteItem();
                              },
                              child: const Text(
                                "Order",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
    );
  }
}
