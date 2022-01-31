import 'package:booksella/screens/cart_screen.dart';
import 'package:booksella/screens/order_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.fromLTRB(
          15, MediaQuery.of(context).size.height * 0.02, 0, 0),
      height: screenHeight * 0.07,
      width: double.infinity,
      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // side drawer navigator
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(OrderScreen.routeName);
            },
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 180,
          ),
          // cart navigator
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              )),
          // user profile image
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
                size: 35,
              ),
            ),
          )
        ],
      ),
    );
  }
}
