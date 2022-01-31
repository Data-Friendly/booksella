class CartItem {
  final String id;
  final String imageUrl;
  final String bookName;
  // final String publisher;
  final int price;
  final int quantity;

  CartItem({
    required this.id,
    required this.imageUrl,
    required this.bookName,
    required this.price,
    required this.quantity,
  });
}
