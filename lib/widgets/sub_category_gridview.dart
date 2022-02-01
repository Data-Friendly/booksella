import 'package:booksella/providers/book_provider.dart';
import 'package:booksella/models/book.dart';
import 'package:booksella/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuBCategoryGridView extends StatelessWidget {
  var subCategory;
  var category;
  SuBCategoryGridView(this.subCategory, this.category, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var bookdata = Provider.of<BookData>(context);
    List<Book> gridList = [...bookdata.categoryData2(subCategory, category)];
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * 0.05, screenheight * 0.025,
            screenWidth * 0.05, screenheight * 0.25),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // it helps us to define certain amounts of colums

              crossAxisCount: 3,
              childAspectRatio: 1, // height by width ratio
              crossAxisSpacing: 2, // sapcing between the columns
              mainAxisSpacing: 2, // spacing between the rows
              mainAxisExtent: 200 // height of the column
              ),
          itemCount: gridList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (ctx) {
                      return DetailScreen(gridList[index].bookId);
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
                          gridList[index].imageUrl.toString(),
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
                    gridList[index].bookName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                    style: const TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
                Container(
                  height: screenheight * 0.022,
                  width: screenWidth * 0.26,
                  alignment: Alignment.center,
                  child: Text(
                    'Rs.' + gridList[index].price.toString(),
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
