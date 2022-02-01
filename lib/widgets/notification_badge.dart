import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  var screenwidth;
  Badge(this.screenwidth, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              size: screenwidth * 0.09,
            )),
        Positioned(
            right: 3,
            top: 9,
            child: CircleAvatar(
              child: const Text(
                '1',
                // dynamic value based on the items present in the notification list
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              backgroundColor: Colors.orange[900],
              radius: screenwidth * 0.02,
            )),
      ],
    );
  }
}
