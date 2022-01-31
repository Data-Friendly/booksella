// dart packages
// flutter packages
import 'package:flutter/material.dart';
// local packages

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {},
      child: Container(
        height: screenHeight * 0.06,
        width: screenWidth * 0.9,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 19),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.03, 0, screenWidth * 0.04, 0),
              child: Icon(
                Icons.search_rounded,
                size: screenWidth * 0.07,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              "Search",
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
