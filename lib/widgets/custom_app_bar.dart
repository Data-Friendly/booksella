import 'package:booksella/providers/book_provider.dart';
import 'package:booksella/screens/cart_screen.dart';
import 'package:booksella/widgets/notification_badge.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    var bookdata = Provider.of<BookData>(context);
    var count = bookdata.count;

    return SizedBox(
      height: screenHeight * 0.07,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                screenwidth * 0.03, 0, screenwidth * 0.53, 0),
            child: count != 'HomeScreen'
                ? IconButton(
                    onPressed: () {
                      // function that sets counts to 'HomeScreen'
                      bookdata.setcount();
                    },
                    icon: Icon(Icons.arrow_back, size: screenwidth * 0.07))
                : IconButton(
                    onPressed: () {
                      Provider.of<BookData>(context, listen: false)
                          .fetchBookData();
                    },
                    icon: Icon(
                      Icons.menu,
                      size: screenwidth * 0.09,
                    ),
                  ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, screenwidth * 0.02, 0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: screenwidth * 0.09,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Badge(screenwidth),
          ),
        ],
      ),
    );
  }
}
