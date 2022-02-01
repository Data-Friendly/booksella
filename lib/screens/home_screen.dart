import 'package:booksella/widgets/custom_app_bar.dart';
import 'package:booksella/widgets/book_shelf.dart';
import 'package:booksella/widgets/bottom_navigation_bar.dart';
import 'package:booksella/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.005,
            ),
            const CustomAppBar(),
            SizedBox(
              height: height * 0.008,
            ),
            const SearchBar(),
            const BookShelfWidget(),
          ],
        ),
      ),
    );
  }
}
