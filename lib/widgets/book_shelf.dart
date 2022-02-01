import 'package:booksella/providers/book_provider.dart';
import 'package:booksella/models/book.dart';
import 'package:booksella/models/sell_all.dart';
import 'package:booksella/screens/detail_screen.dart';
import 'package:booksella/screens/grid_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookShelfWidget extends StatefulWidget {
  const BookShelfWidget({Key? key}) : super(key: key);

  @override
  State<BookShelfWidget> createState() => _BookShelfWidgetState();
}

class _BookShelfWidgetState extends State<BookShelfWidget> {
  @override
  Widget build(BuildContext context) {
    var count = Provider.of<BookData>(context).count;
    var bookdata = Provider.of<BookData>(context);
    var screenheight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    Map<String, List<Book>> map = {
      '1-year': [...bookdata.categoryData('1-year')],
      "2-year": [...bookdata.categoryData("2-year")],
      "3-year": [...bookdata.categoryData('3-year')],
      "4-year": [...bookdata.categoryData('4-year')],
    };

    Map<String, List<Book>> mainCategory = {
      "Engineering": [...bookdata.categoryyData("Engineering")],
      "Medical": [...bookdata.categoryyData("Medical")],
      "Competitive Exams": [...bookdata.categoryyData("Competitive Exams")],
    };

    Map<String, List<Book>> medicalSubCategoryMap = {
      "1-year": [...bookdata.categoryData2('1-year', 'Medical')],
      '2-year': [...bookdata.categoryData2('2-year', 'Medical')],
      '3-year': [...bookdata.categoryData2('3-year', 'Medical')],
      '4-year': [...bookdata.categoryData2('4-year', 'Medical')],
      '5-year': [...bookdata.categoryData2('5-year', 'Medical')],
    };

    Map<String, List<Book>> entraceExamsSubCategory = {
      "JEE and NEET": [
        ...bookdata.categoryData2("JEE and NEET", "Competitive Exams")
      ],
      "UPSC": [...bookdata.categoryData2("UPSC", "Competitive Exams")],
      "GATE and IES": [
        ...bookdata.categoryData2("GATE and IES", "Competitive Exams")
      ]
    };

    dynamic func(String count, var index) {
      if (count == 'HomeScreen') {
        //All Category Map
        return SeeAll(
            keys: mainCategory.keys.elementAt(index),
            list:
                mainCategory[mainCategory.keys.elementAt(index)] as List<Book>,
            length: mainCategory.keys.length);
      }
      if (count == 'Engineering') {
        // Engineering Map
        return SeeAll(
            keys: map.keys.elementAt(index),
            list: map[map.keys.elementAt(index)] as List<Book>,
            length: map.keys.length);
      }
      if (count == "Competitive Exams") {
        // Medical Map
        return SeeAll(
            keys: entraceExamsSubCategory.keys.elementAt(index),
            list: entraceExamsSubCategory[
                entraceExamsSubCategory.keys.elementAt(index)] as List<Book>,
            length: entraceExamsSubCategory.keys.length);
      }
      if (count == 'Medical') {
        // Medical Map
        return SeeAll(
            keys: medicalSubCategoryMap.keys.elementAt(index),
            list: medicalSubCategoryMap[
                medicalSubCategoryMap.keys.elementAt(index)] as List<Book>,
            length: medicalSubCategoryMap.keys.length);
      }
    }

    return Expanded(
      child: ListView.builder(
        itemCount: func(count, 0).length,
        itemBuilder: (BuildContext context, int indexx) {
          print(func(count, indexx).length);
          //   String keys = map.keys.elementAt(indexx);
          //    var listName = map.values.elementAt(indexx);
          return Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.055,
                  ),
                  SizedBox(
                    height: screenheight * 0.035,
                    width: screenWidth * 0.6,
                    child: Text(
                      func(count, indexx).keys,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.15,
                  ),
                  TextButton(
                      onPressed: () {
                        if (count == 'HomeScreen') {
                          bookdata.func1(
                            func(count, indexx).keys.toString(),
                          );
                        } else {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (ctx) {
                            return GridViewScreen(
                                func(count, indexx).keys.toString(), count);
                          }));
                        }
                      },
                      child: const Text(
                        'see all',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )),
                ],
              ),
              Container(
                height: screenheight * 0.231,
                margin: EdgeInsets.fromLTRB(screenWidth * 0.055, 0, 0, 0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: count == 'HomeScreen'
                      ? 4
                      : func(count, indexx).list.length >= 4
                          ? 4
                          : func(count, indexx).list.length,
                  itemBuilder: (BuildContext context, int index) {
                    List listName = func(count, indexx).list;
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, screenWidth * 0.06, 0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (ctx) {
                                return DetailScreen(listName[index].bookId);
                              }));
                            },
                            child: Container(
                                height: screenheight * 0.178,
                                width: screenWidth * 0.26,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.black),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    listName[index].imageUrl.toString(),
                                    fit: BoxFit.fill,
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: screenheight * 0.009,
                          ),
                          Container(
                            height: screenheight * 0.022,
                            width: screenWidth * 0.26,
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              listName[index].bookName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: true,
                              style: const TextStyle(
                                  fontSize: 13, color: Colors.black),
                            ),
                          ),
                          Container(
                            height: screenheight * 0.022,
                            width: screenWidth * 0.26,
                            alignment: Alignment.center,
                            child: Text(
                              'Rs.' + listName[index].price.toString(),
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
