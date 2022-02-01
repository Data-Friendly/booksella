import 'package:booksella/screens/order_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.094,
      width: double.infinity,
      child: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            if (index == 2) {
              Navigator.of(context).pushNamed(OrderScreen.routeName);
            }
          });
        },
        selectedItemColor: Colors.orange[900],
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
        ),
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home_outlined,
                size: width * 0.08,
              )),
          BottomNavigationBarItem(
              label: 'Track',
              icon: Icon(
                Icons.fmd_good_outlined,
                size: width * 0.08,
              )),
          BottomNavigationBarItem(
              label: 'User',
              icon: Icon(Icons.account_circle_outlined, size: width * 0.08)),
        ],
      ),
    );
  }
}
