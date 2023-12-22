import 'package:bananacashierapp/main.dart';
import 'package:flutter/material.dart';
import 'package:bananacashierapp/api/sheets/user_sheets_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bananacashierapp/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  getData() async {
    final api = UserSheetsApi();
    final roomData = await api.getSheet('Cart');
    return roomData;
  }

  getWedget(rooms) {
    List<Widget> roomWidget = [];
    rooms.removeAt(0);
    for (var room in rooms) {
      roomWidget.add(Row(
        children: [
          Container(
            child: Image.network(room[3], height: 85, width: 85),
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
                    room[1],
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(1),
                  child: Text(
                    'Harga : Rp.' + room[2],
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addRemove(room[0], false);
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
                        var id = value.cart.indexWhere((
                          element,
                        ) =>
                            element.id == room.data![0].id);
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
                              .addRemove(room[0], true);
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.green,
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ));
    }
    return roomWidget;
  }

  var roomState;

  @override
  initState() {
    super.initState();

    getData().then((data) {
      setState(() {
        roomState = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (roomState == null) {
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
            "Room",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Icon(
              Icons.shopping_cart,
              color: Colors.black,
            )
          ],
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
                                  children: getWedget(roomState),
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
      );
    }
  }
}
