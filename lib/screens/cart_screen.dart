// ignore_for_file: non_constant_identifier_names

import 'package:booksella/providers/cart_provider.dart';
import 'package:booksella/providers/order_provider.dart';
import 'package:booksella/widgets/cart_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:toast/toast.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const routeName = "/cart_screen";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Razorpay? razorpay;
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
  void initState() {
    razorpay = Razorpay();
    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, PaymentSuccessHandler);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, PaymentFaliureHandler);
    razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, ExternalWalletHandler);
    super.initState();
  }

  @override
  void dispose() {
    razorpay!.clear();
    super.dispose();
  }

  // open checkout
  void openCheckout(BuildContext context) async {
    var options = {
      "key": "rzp_test_fCcGUp6jebfTG4",
      "amount": (Provider.of<Cart>(context, listen: false).totalAmount) * 100,
      "name": "booksella",
      "description": "Payment for books set",
      "prefill": {
        "contact": await Provider.of<Cart>(context, listen: false)
            .phoneNumber("phone"),
        "email": await Provider.of<Cart>(context, listen: false)
            .phoneNumber("email"),
      },
      "external": {
        "wallets": ["paytm", "phonepe", "amazonpay"]
      }
    };

    try {
      razorpay!.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  // payment sucess handler
  void PaymentSuccessHandler() {
    print("payment Successs");
  }

  // payment faliure handler
  void PaymentFaliureHandler() {
    print(
      "payment Failed",
    );
  }

  // payment sucess handler
  void ExternalWalletHandler() {
    print("External Wallet");
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
                              onPressed: () async {
                                openCheckout(context);
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
