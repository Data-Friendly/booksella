// dart packages
// flutter packages
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// local packages
import '../widgets/custom_app_bar.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bookController = Get.put(BookController());
    // final categories = ["engineering", "medical", "competitive"];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // custom app bar widget
            const CustomAppBar(),
            // search widget
            const SearchBar(),
            // builder
            // GetBuilder<BookController>(builder: (controller) {
            //   return Flexible(
            //     child: ListView.builder(
            //         // shrinkWrap: true,
            //         itemCount: categories.length,
            //         itemBuilder: (ctx, index) {
            //           print(bookController.categoriesBooks(categories[index]));
            //           return Field(
            //             categoryList:
            //                 bookController.categoriesBooks(categories[index]),
            //             category: categories[index],
            //           );
            //         }),
            //   );
            // })
          ],
        ),
      ),
    );
  }
}
