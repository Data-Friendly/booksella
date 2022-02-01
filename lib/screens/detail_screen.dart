import 'package:booksella/providers/book_provider.dart';
import 'package:booksella/models/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  var bookId;

  DetailScreen(this.bookId, {Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    var bookdata = Provider.of<BookData>(context);
    List<Book> bookidList = bookdata.filterbyid(widget.bookId);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var containerheight = screenHeight * 0.495;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.065),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                size: screenWidth * 0.07,
                color: Colors.black,
              ),
            ),
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Detail Book',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            Container(
              height: containerheight,
              width: double.infinity,
              alignment: Alignment.center,
              child: Center(
                child: Card(
                  elevation: 25,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                      height: containerheight * 0.65,
                      width: screenWidth * 0.48,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          bookidList[0].imageUrl.toString(),
                          fit: BoxFit.fill,
                        ),
                      )),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          constraints.maxWidth * 0.05,
                          constraints.maxHeight * 0.08,
                          constraints.maxWidth * 0.05,
                          0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: constraints.maxHeight * 0.24,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' Rs.${bookidList[0].price.toString()}',
                                        style: const TextStyle(
                                            color: Color.fromRGBO(
                                                0, 176, 135, 10)),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.003,
                                      ),
                                      Text(
                                        bookidList[0].bookName,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.003,
                                      ),
                                      const Text(
                                        'S.chand',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  radius: screenWidth * 0.078,
                                  backgroundColor:
                                      const Color.fromRGBO(0, 176, 135, 10),
                                  child: Icon(
                                    Icons.bookmark,
                                    color: Colors.white,
                                    size: screenWidth * 0.07,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.01),
                            child: Container(
                              height: constraints.maxHeight * 0.2,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(245, 245, 245, 1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.072,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.01),
                                    child: SizedBox(
                                        height: screenHeight * 0.066,
                                        width: screenWidth * 0.74,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(0,
                                                  screenHeight * 0.0065, 0, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'No. of pages',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            screenWidth * 0.08,
                                                            screenHeight *
                                                                0.003,
                                                            0,
                                                            0),
                                                    child: const Text(
                                                      '1453',
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          color: Color.fromRGBO(
                                                              133,
                                                              133,
                                                              133,
                                                              1)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const VerticalDivider(),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(0,
                                                  screenHeight * 0.0065, 0, 0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Language',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            screenWidth * 0.045,
                                                            screenHeight *
                                                                0.003,
                                                            0,
                                                            0),
                                                    child: const Text(
                                                      'english',
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          color: Color.fromRGBO(
                                                              133,
                                                              133,
                                                              133,
                                                              1)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.08,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: constraints.maxHeight * 0.2,
                            width: double.infinity,
                            child: const Text(
                              'Gallery west residence is an apartment that is a part of Akr galary West mixed used complex that is integrated with office...',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                00, screenHeight * 0.014, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: screenHeight * 0.06,
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          245, 245, 245, 1),
                                      borderRadius: BorderRadius.circular(5)),
                                  width: screenWidth * 0.5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            screenWidth * 0.027, 0, 0, 0),
                                        child: const Text(
                                          'QTY',
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 16),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  counter--;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Colors.grey,
                                              )),
                                          Text(
                                            '${counter}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  0, 176, 135, 10),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  counter++;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                color: Colors.grey,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: screenHeight * 0.06,
                                  width: screenWidth * 0.31,
                                  child: const Center(
                                    child: Text(
                                      'Add to cart',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.orange[900],
                                      borderRadius: BorderRadius.circular(5)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
