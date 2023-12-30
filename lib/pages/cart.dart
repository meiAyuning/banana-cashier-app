import 'package:bananacashierapp/main.dart';
import 'package:flutter/material.dart';
// import 'package:bananacashierapp/api/sheets/user_sheets_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bananacashierapp/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

void onSaveButtonPressed() {
  print('Save button pressed!');
}

class _CartPageState extends State<CartPage> {
  getData() async {
    CartProvider dataCart = CartProvider();
    // double totalPrice = 0.0;
    // final api = UserSheetsApi();
    // final cartData = await api.getSheet('Cart');
    return dataCart.cart;
  }

  getWedget(carts) {
    List<Widget> cartWidget = [];
    // carts.removeAt(0);
    for (var cart in carts) {
      cartWidget.add(Row(
        children: [
          Container(
            child: Image.network(cart.image, height: 85, width: 85),
            height: 85,
            width: 85,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(1),
                  child: Text(
                    'Nama' + cart.name,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(1),
                  child: Text(
                    'Rp. ' + cart.price.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Row(
                  children: [
                    // IconButton(
                    //     onPressed: () {
                    //       Provider.of<CartProvider>(context, listen: false)
                    //           .addRemove(int.parse(cart[0]), false);
                    //     },
                    //     icon: Icon(
                    //       Icons.remove_circle,
                    //       color: Colors.red,
                    //     )),
                    IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addRemove(int.parse(cart.id), false);
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    // Consumer<CartProvider>(
                    //   builder: (context, value, _) {
                    //     var id = value.cart.indexWhere(
                    //         (element) => element.id == int.parse(cart[0]));
                    //     return Text(
                    //       (id == -1) ? "0" : value.cart[id].quantity.toString(),
                    //       textAlign: TextAlign.left,
                    //     );
                    //   },
                    // ),
                    Consumer<CartProvider>(
                      builder: (context, value, _) {
                        var id = value.cart
                            .indexWhere((element) => element.id == cart.id);
                        return Text(
                          (id == -1) ? "0" : value.cart[id].quantity.toString(),
                          textAlign: TextAlign.left,
                        );
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addRemove(int.parse(cart.id), true);
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.green,
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ));
    }
    return cartWidget;
  }

  var cartState;

  @override
  initState() {
    super.initState();
    setState(() {
      CartProvider dataCart = CartProvider();
      cartState = dataCart.cart;
    });
  }

  // int calculateTotalPrice() {
  //   int total = 0;
  //   for (var item in _cartItem) {
  //     total = item['price'] * item['quantity'];
  //   }
  //   return total;
  // }

  @override
  Widget build(BuildContext context) {
    if (cartState == null) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Banana Banyuwangi"),
        ),
        body: Center(
          child: SpinKitSpinningLines(
            color: Color.fromARGB(235, 235, 188, 34),
            size: 50.0,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          backgroundColor: Color.fromARGB(235, 235, 188, 34),
          title: Text(
            "Banana Cashier",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Column(
                                  children: getWedget(cartState),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \Rp.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Payment success!');
                  },
                  child: Text('Pay Now'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
