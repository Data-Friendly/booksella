import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final bookNames = [
    'engineering',
    'medical',
    'science',
    'maths',
    'human values',
    'upsc',
    'english',
    'hindi',
    'history'
  ];
  final recentList = ['maths', 'medical', 'human values'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on the left off app bar
    return IconButton(
        onPressed: () {
          close(context, 'null');
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result when someone searches for something
    return const Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for anything
    final suggestionList = query.isEmpty
        ? recentList
        : bookNames.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {},
          leading: const Icon(Icons.book),
          title: RichText(
              text: TextSpan(
                  text: suggestionList[index].substring(0, query.length),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: const TextStyle(
                      color: Colors.grey,
                    ))
              ])),
          // show list tiles for the element that matches with the query that user passed
        );
      },
    );
  }
}
// we havenot used set state anywhere search delegate is doing all the stuff
