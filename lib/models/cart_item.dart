class CartItem {
  int id;
  int idCart;
  String name;
  int price;
  String image;
  int quantity;
  int subTotal;
  String tipe;
  CartItem(
      {required this.id,
      required this.idCart,
      required this.name,
      required this.price,
      required this.image,
      required this.quantity,
      required this.subTotal,
      required this.tipe});
}
