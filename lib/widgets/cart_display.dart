import 'package:booksella/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartDisplay extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String bookName;
  final int price;
  final int quantity;
  const CartDisplay({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.bookName,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var totalHeight = MediaQuery.of(context).size.height;
    var totalWidth = MediaQuery.of(context).size.width;
    var cartitems = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        height: totalHeight * 0.15,
        margin:
            EdgeInsets.fromLTRB(0, totalHeight * 0.02, totalWidth * 0.06, 0),
        color: const Color.fromRGBO(0, 176, 135, 10),
        child: Icon(
          Icons.delete_outlined,
          color: Colors.white,
          size: totalHeight * 0.15 * 0.3,
        ),
        alignment: Alignment.centerRight,
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Are You Sure ?"),
            content: Text("Are you want to delete $bookName from the cart"),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                    primary: const Color.fromRGBO(0, 176, 135, 10)),
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: const Text("No"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange[900],
                ),
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: const Text("Yes"),
              ),
            ],
          ),
        );
      },
      onDismissed: (direction) => cartitems.removeItem(id),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
        height: totalHeight * 0.15,
        width: totalWidth * 0.9,
        margin: EdgeInsets.fromLTRB(
            totalWidth * 0.06, totalHeight * 0.02, totalWidth * 0.06, 0),
        child: Row(
          children: [
            // image display
            Container(
              padding: EdgeInsets.fromLTRB(totalWidth * 0.9 * 0.03, 0, 0, 0),
              width: totalWidth * 0.9 * 0.25,
              height: totalHeight * 0.15 * 0.8,
              child: Card(
                elevation: 4,
                child: Image(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // details
            Container(
              // color: Colors.green,
              margin: EdgeInsets.fromLTRB(totalWidth * 0.9 * 0.03,
                  totalHeight * 0.15 * 0.1, 0, totalHeight * 0.15 * 0.04),
              padding: EdgeInsets.fromLTRB(
                  0, totalHeight * 0.15 * 0.02, 0, totalHeight * 0.15 * 0.11),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // margin: EdgeInsets.fromLTRB(totalWidth * 0.9 * 0.03,
                    //     totalHeight * 0.15 * 0.1, 0, totalHeight * 0.15 * 0.04),
                    padding: EdgeInsets.fromLTRB(0, totalHeight * 0.15 * 0.02,
                        0, totalHeight * 0.15 * 0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookName,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: totalHeight * 0.15 * 0.03,
                        ),
                        const Text(
                          "by S.Chand",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: EdgeInsets.only(
                        top: totalHeight * 0.15 * 0.01, left: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            cartitems.increDecrementItemCount(false, id);
                          },
                          icon: const Icon(
                            Icons.remove,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "$quantity",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 176, 135, 10),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            cartitems.increDecrementItemCount(true, id);
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: totalWidth * 0.9 * 0.25,
                        ),
                        Text(
                          "\u{20B9}$price",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(
                              0,
                              176,
                              135,
                              10,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
