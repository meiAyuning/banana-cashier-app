import 'package:bananacashierapp/api/sheets/user_sheets_api.dart';
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
  insert() async {
    CartProvider dataCart = new CartProvider();
    final api = UserSheetsApi();
    final sheet = await api.getWorkSheet('Cart');
    var cart = await sheet?.values.allRows();
    var row = cart.length;

    dataCart.cart.forEach((element) async {
      ++row;
      await sheet.values.insertRow(
        row,
        [
          element.idCart + 1,
          element.name,
          element.price,
          element.quantity,
          element.quantity * element.price
        ],
      );
    });

    dataCart.removeCart();
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
                    cart.name,
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
                    IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addRemoveCart(cart.id, false, cart);
                          setState(() {
                            total = getTotal();
                          });
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Consumer<CartProvider>(
                      builder: (context, value, _) {
                        var idCart = value.cart.indexWhere((element) =>
                            element.id == cart.id && element.tipe == cart.tipe);
                        return Text(
                          (idCart == -1)
                              ? "0"
                              : value.cart[idCart].quantity.toString(),
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
                              .addRemoveCart(cart.id, true, cart);
                          setState(() {
                            total = getTotal();
                          });
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
  var total;
  @override
  initState() {
    super.initState();
    setState(() {
      CartProvider dataCart = CartProvider();
      total = dataCart.total;
      cartState = dataCart.cart;
    });
  }

  int getTotal() {
    CartProvider cartProvider = new CartProvider();
    cartProvider.caculateTotal();
    return cartProvider.total;
  }

  void _checkout() async {
    await insert();
    Future.delayed(Duration(seconds: 1), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Payment Completed !'),
            content: Text('Thank you for your purchase ;)'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

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
            size: 30.0,
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
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total : \Rp.' + total.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: _checkout,
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
