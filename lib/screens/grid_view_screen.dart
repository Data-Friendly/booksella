import 'package:booksella/providers/datasearch.dart';
import 'package:booksella/widgets/sub_category_gridview.dart';
import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  String keys;
  String count;
  GridViewScreen(this.keys, this.count, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.085,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(width * 0.05, 0, width * 0.04, 0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: width * 0.07,
                        )),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Container(
                    height: screenHeight * 0.055,
                    width: width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: const Color.fromRGBO(221, 221, 221, 1),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              width * 0.05, 0, width * 0.04, 0),
                          child: IconButton(
                              onPressed: () {
                                showSearch(
                                    context: context, delegate: DataSearch());
                              },
                              icon: Icon(
                                Icons.search,
                                size: width * 0.07,
                              )),
                        ),
                        const Text(
                          'Search',
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromRGBO(106, 106, 106, 1),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.fromLTRB(width * 0.085, 0, width * 0.04, 0),
                  child: Text(
                    keys,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SuBCategoryGridView(keys, count),
          ],
        ),
      ),
    );
  }
}
