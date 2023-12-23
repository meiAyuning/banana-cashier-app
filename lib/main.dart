import 'dart:async';

import 'package:bananacashierapp/pages/cart.dart';
import 'package:bananacashierapp/pages/food.dart';
import 'package:bananacashierapp/pages/room.dart';
import 'package:bananacashierapp/pages/trip.dart';
import 'package:bananacashierapp/providers/cart_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartProvider>(
        create: (context) => CartProvider(),
        child: MaterialApp(
            title: 'Banana Banyuwangi',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.yellow),
            home: SplashScreenPage()));
  }
}

//Halaman Splash Screen
class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return HomePage();
        }),
      );
    });
  }

//logo di dalam splash screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(235, 235, 188, 34),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 50, // Atur posisi teks sesuai keinginan Anda
            left: 0,
            right: 0,
            child: Text(
              'Welcome To Banana Cashier',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black, // Ganti warna teks sesuai kebutuhan
                fontSize: 30.0, // Sesuaikan ukuran teks
                fontWeight: FontWeight.bold, // Sesuaikan gaya teks
              ),
            ),
          ),
          // Gambar splash screen
          Image.asset(
            'images/logo.png',
            width: 450.0,
            height: 450.0,
            // fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final List<String> imgList = [];

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(235, 235, 188, 34),
        title: Text(
          "Banana Banyuwangi",
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          CarouselSlider(
            items: [
              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage("images/banner banana.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage("images/kamar 1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage("images/kamar2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 150.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Room",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                ElevatedButton(
                  child: const Text(
                    "View All",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RoomPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                  ),
                ),
              ],
            ),
          ),
          _cardItem(1),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Tour & Trip",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                ElevatedButton(
                  child: const Text(
                    "View All",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TripPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                  ),
                ),
              ],
            ),
          ),
          _cardTrip(1),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Food & Drink",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                ElevatedButton(
                  child: const Text(
                    "View All",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                  ),
                ),
              ],
            ),
          ),
          _cardFood(1),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }

  _cardItem(image) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Row(
        children: <Widget>[
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.all(15),
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/boild banana.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              Text("Boiled Banana",
                  style: TextStyle(color: Colors.black, fontSize: 10))
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.all(15),
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/grilled banana.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              Text("Grilled Banana",
                  style: TextStyle(color: Colors.black, fontSize: 10))
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.all(15),
                width: 75.0,
                height: 75.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/fried banana.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              Text("Fried Banana",
                  style: TextStyle(color: Colors.black, fontSize: 10))
            ],
          ),
        ],
      ),
    );
  }
}

_cardTrip(image) {
  return Padding(
    padding: EdgeInsets.all(0),
    child: Row(
      children: <Widget>[
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.all(15),
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/sukamade.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Text("Sukamade",
                style: TextStyle(color: Colors.black, fontSize: 10))
          ],
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.all(15),
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/ijen.jpg"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Text("Ijen Mountain",
                style: TextStyle(color: Colors.black, fontSize: 10))
          ],
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.all(15),
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/baluran.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Text("Baluran", style: TextStyle(color: Colors.black, fontSize: 10))
          ],
        ),
      ],
    ),
  );
}

_cardFood(image) {
  return Padding(
    padding: EdgeInsets.all(0),
    child: Row(
      children: <Widget>[
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.all(15),
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/jus.jpg"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Text("Fresh Juice",
                style: TextStyle(color: Colors.black, fontSize: 10))
          ],
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.all(15),
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/sandwich.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Text("Sandwich",
                style: TextStyle(color: Colors.black, fontSize: 10))
          ],
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.all(15),
              width: 75.0,
              height: 75.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/gado-gado.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            Text("Gado - Gado",
                style: TextStyle(color: Colors.black, fontSize: 10))
          ],
        ),
      ],
    ),
  );
}
