import 'package:booksella/models/book.dart';
import 'package:booksella/providers/book_provider.dart';
import 'package:booksella/widgets/custom_app_bar.dart';
import 'package:booksella/widgets/book_shelf.dart';
import 'package:booksella/widgets/bottom_navigation_bar.dart';
import 'package:booksella/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isinit = true;
  bool _isloading = true;
  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    if (_isinit) {
      await Provider.of<BookData>(context, listen: false).fetchBookData();
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
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      body: SafeArea(
        child: _isloading
            ? const Center(child: CircularProgressIndicator())
            : Column(
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
      // floatingActionButton: FloatingActionButton(onPressed: () async {
      //   // List<Book> booklisttemp =
      //   //     await Provider.of<BookData>(context, listen: false).fetchBookData();
      //   // print(booklisttemp);
      // }),
    );
  }
}
