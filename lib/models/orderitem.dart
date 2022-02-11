import '../models/cartitem.dart';

// enum OrderStatus {
//   delivered,
//   cancelled,
//   yetToDeliver,
// }

class OrderItem {
  final String id;
  final int ammount;
  final List<CartItem> orderedProducts;
  final DateTime date;
  final String orderStatus;

  OrderItem({
    required this.id,
    required this.ammount,
    required this.orderedProducts,
    required this.date,
    required this.orderStatus,
  });
}
