import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:booksella/models/book.dart';

// dummy books for testing
class BookData with ChangeNotifier {
  List<Book> booksList = [];
  List<Book> get booksdata {
    return [...booksList];
  }

  // get the data from the database
  fetchBookData() async {
    QuerySnapshot<Map<String, dynamic>> dataDocs;
    dataDocs = await FirebaseFirestore.instance.collection("Books").get();
    List<Book> templist = [];
    for (var i = 0; i < dataDocs.docs.length; i++) {
      templist.add(
        Book(
          bookId: dataDocs.docs[i].id,
          category: dataDocs.docs[i]["category"],
          subCategory: dataDocs.docs[i]["subCategory"],
          bookName: dataDocs.docs[i]["bookName"],
          price: dataDocs.docs[i]["price"],
          imageUrl: dataDocs.docs[i]["imageUrl"],
        ),
      );
      booksList = templist;
    }
    notifyListeners();
  }

  String count = 'HomeScreen';
  List<Book> get engineeringData {
    return booksdata
        .where((element) => element.category == "Engineering")
        .toList();
  }

  List<Book> categoryData(String yearnumber) {
    return engineeringData
        .where((element) => element.subCategory == yearnumber)
        .toList();
  }

  List<Book> categoryyData(String categoryName) {
    return booksdata
        .where((element) => element.category == categoryName)
        .toList();
  }

  List<Book> categoryData2(String yearName, String categoryName) {
    return categoryyData(categoryName)
        .where((element) => element.subCategory == yearName)
        .toList();
  }

// function changes count values
  func1(
    String keys,
  ) {
    count = keys;
    print(count);
    notifyListeners();
  }

  setcount() {
    count = 'HomeScreen';
    notifyListeners();
  }

  List<Book> filterbyid(String bookId) {
    return booksdata.where((element) => element.bookId == bookId).toList();
  }
}

// void printFunction() {
//   print(booksList[0].category);
// }
