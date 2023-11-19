import 'dart:async';
import 'package:bananacashierapp/main.dart';
import 'package:flutter/material.dart';

class TripPage extends StatefulWidget {
  TripPage({Key? key}) : super(key: key);

  @override
  State<TripPage> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back,color: Colors.black),
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
              color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
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
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SplashScreenPage()),
                                          );
                                        },
                                        child: Container(
                                          child: Image.asset(
                                              'images/green bay.jpg'),
                                          height: 85,
                                          width: 85,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Green Bay',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 160, 107, 8)),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Private Car Rp. 700.000',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SplashScreenPage()),
                                          );
                                        },
                                        child: Container(
                                          child:
                                              Image.asset('images/lider.jpg'),
                                          height: 85,
                                          width: 85,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Lider Waterfall',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 160, 107, 8)),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Private Car Rp. 500.000',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 129, 12)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SplashScreenPage()),
                                          );
                                        },
                                        child: Container(
                                          child:
                                              Image.asset('images/baluran.jpg'),
                                          height: 85,
                                          width: 85,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Baluran National Park',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 160, 107, 8)),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Private Car Rp. 500.000/ car',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 129, 12)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SplashScreenPage()),
                                          );
                                        },
                                        child: Container(
                                          child:
                                              Image.asset('images/baluran.jpg'),
                                          height: 85,
                                          width: 85,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Jenang Dodol Ketan Hitam',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 160, 107, 8)),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Harga : Rp. 150.000',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 129, 12)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SplashScreenPage()),
                                          );
                                        },
                                        child: Container(
                                          child:
                                              Image.asset('images/baluran.jpg'),
                                          height: 85,
                                          width: 85,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Jenang Dodol Ketan Hitam',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 160, 107, 8)),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Harga : Rp. 150.000',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 129, 12)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SplashScreenPage()),
                                          );
                                        },
                                        child: Container(
                                          child:
                                              Image.asset('images/baluran.jpg'),
                                          height: 85,
                                          width: 85,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Jenang Dodol Ketan Hitam',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 160, 107, 8)),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Harga : Rp. 150.000',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 129, 12)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SplashScreenPage()),
                                          );
                                        },
                                        child: Container(
                                          child:
                                              Image.asset('images/baluran.jpg'),
                                          height: 85,
                                          width: 85,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Jenang Dodol Ketan Hitam',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 160, 107, 8)),
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.all(1),
                                              child: Text(
                                                'Harga : Rp. 150.000',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 218, 129, 12)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
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
