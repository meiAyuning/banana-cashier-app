class CartItem {
  int id;
  String name;
  int price;
  String image;
  int quantity;
  double total;

  CartItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.quantity,
      required this.total});
}
