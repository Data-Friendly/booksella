import 'package:booksella/providers/book_provider.dart';
import 'package:booksella/providers/cart_provider.dart';
import 'package:booksella/providers/order_provider.dart';
import 'package:booksella/screens/cart_screen.dart';
import 'package:booksella/screens/home_screen.dart';
import 'package:booksella/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => BookData()),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Order(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        routes: {
          CartScreen.routeName: (ctx) => const CartScreen(),
          OrderScreen.routeName: (ctx) => const OrderScreen()
        },
      ),
    );
  }
}
