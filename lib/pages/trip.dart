import 'package:bananacashierapp/main.dart';
import 'package:bananacashierapp/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:bananacashierapp/api/sheets/user_sheets_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bananacashierapp/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class TripPage extends StatefulWidget {
  TripPage({Key? key}) : super(key: key);

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  getDataTrip() async {
    final api = UserSheetsApi();
    final tripData = await api.getSheet('Tour');
    return tripData;
  }

  getWedget(trips) {
    List<Widget> tripWidget = [];
    trips.removeAt(0);
    for (var trip in trips) {
      tripWidget.add(
        Row(
          children: [
            Container(
              child: Image.network(trip[3], height: 85, width: 85),
              height: 85,
              width: 85,
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(1),
                    child: Text(
                      trip[1],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(1),
                    child: Text(
                      'Rp. ' + trip[2],
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addRemove(int.parse(trip[0]), false);
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        )),
                      // IconButton(
                      //     onPressed: () {
                      //       Provider.of<CartProvider>(context, listen: false)
                      //           .addRemove(trip[0], false);
                      //     },
                      //     icon: Icon(
                      //       Icons.remove_circle,
                      //       color: Colors.red,
                      //     )),
                      SizedBox(
                        width: 10,
                      ),
                      // Consumer<CartProvider>(
                      //   builder: (context, value, _) {
                      //     var id = value.cart.indexWhere(
                      //         (element) => element.id == trip.data![0].id);
                      //     return Text(
                      //       (id == -1)
                      //           ? "0"
                      //           : value.cart[id].quantity.toString(),
                      //       textAlign: TextAlign.left,
                      //     );
                      //   },
                      // ),
                      Consumer<CartProvider>(
                      builder: (context, value, _) {
                        var id = value.cart.indexWhere(
                            (element) => element.id == int.parse(trip[0]));
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
                              .addRemove(int.parse(trip[0]), true);
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
        ),
      );
    }

    return tripWidget;
  }

  var tripState;

  @override
  initState() {
    super.initState();

    getDataTrip().then((data) {
      setState(() {
        tripState = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (tripState == null) {
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
            "Tour & Trip",
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
                                  children: getWedget(tripState),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(),
              ),
            );
          },
          child: Icon(Icons.shopping_cart),
        ),
      );
    }
  }
}
