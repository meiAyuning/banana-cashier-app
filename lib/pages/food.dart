import 'package:bananacashierapp/main.dart';
import 'package:bananacashierapp/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:bananacashierapp/api/sheets/user_sheets_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bananacashierapp/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  getDataFood() async {
    final api = UserSheetsApi();
    final foodData = await api.getSheet('Menu');
    return foodData;
  }

  getWedget(foods) {
    List<Widget> foodWidget = [];
    foods.removeAt(0);
    for (var food in foods) {
      foodWidget.add(
        Row(
          children: [
            Container(
              child: Image.network(food[3], height: 85, width: 85),
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
                      food[1],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(1),
                    child: Text(
                      'Rp. ' + food[2],
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false)
                                .addRemove(int.parse(food[0]), false);
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
                          var id = value.cart.indexWhere(
                              (element) => element.id == int.parse(food[0]));
                          return Text(
                            (id == -1)
                                ? "0"
                                : value.cart[id].quantity.toString(),
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
                              .addRemove(int.parse(food[0]), true);
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

    return foodWidget;
  }

  var foodState;

  @override
  initState() {
    super.initState();

    getDataFood().then((data) {
      setState(() {
        foodState = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (foodState == null) {
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
            "Food & Drink",
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
                                  children: getWedget(foodState),
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
