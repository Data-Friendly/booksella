import 'package:booksella/providers/datasearch.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.9,
      height: height * 0.057,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 19),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.03, 0, width * 0.04, 0),
            child: IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.5),
          color: const Color.fromRGBO(221, 221, 221, 1)),
    );
  }
}
