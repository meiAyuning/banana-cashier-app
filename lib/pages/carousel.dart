import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarouselSlider extends StatefulWidget {
  final List<String> imgList = [];

  MyCarouselSlider({Key? key}) : super(key: key);

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          CarouselSlider(
            items: [
              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "data:image/jpeg;base64,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"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "data:image/jpeg;base64,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hdI2U97s1bXqZgHYBB2D1BHUETkJ+dVYRERRpUVVUeOgBoD6CcxODuNxYiIAMSyQCREsgG5IiSwKI2ZJYsgAZdzjLJYGG7U8Lvy6Erov+zuty2FtuvMArDl5l6jqQflMJ2f7EWVZK5WXctzo3OqqXfmceDM7aJ14614gdZukTqp4yrTpulB2TvwV8+uprdOLd2WWSJzWMxG4gwCkybkiSwLuTcSRZFLuY3tFhX34xrxrvs9vOjc/M69FO9cy9R11MlJM6cnCSktV0v5EaurM0rhXYzI+1V5WdkjIatlZVD2WFip2u3cDSg9dATdYiba+InWac+GSSVkl3EhBR0LJLJNJkWBIJZQIkiUCWSWAJJZBICyREgEREAsREgEREARG5IIWJJdwBERBRESwDjERKBLJEASySygSSySgREQBLJEA5SREgJEskgERLAJERAEskQCxJOUgJEs4wCyREoEREARLJAERLAESzjKBERKBEaiUCIIkgFiIkBykiWQEkliAJJZJAIiWASJYgEiWIBIiIAlklgEliJQJZJJQIiIAiSUCUCJYgCQiWIBxlgiIAiIkKWWcYghYiWQEiIgCIiAIiIAiIgCJZIBZJIlAiIgoklgCUgAljcQBERAEkRKCyGIkBJREQwWSIkAliIAiIkIUyREFEREAREQQGSIlKIiIAMkRKCiWIgEEsRKBERAP/9k="),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_600,q_auto,w_600//hotelier-images/12/77/8e3d85391a8c5326e2629256885b99707ba99d7e337d38a12ea656eda672.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: 380.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Room",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 200.0,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 3 / 2),
              children: <Widget>[
                _gridItem(Icons.roofing),
                _gridItem(Icons.food_bank_outlined),
                _gridItem(Icons.local_drink_outlined)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Text(
                  "Latest",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          _cardItem(1),
          _cardItem(2),
          _cardItem(3),
          _cardItem(4),
        ],
      ),
    );
  }

  _cardItem(image) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("url"), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ],
      ),
    );
  }

  _gridItem(icon) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          child: Icon(
            icon,
            size: 35.0,
            color: Colors.white,
          ),
          backgroundColor: Colors.deepOrange.withOpacity(0.9),
        ),
        SizedBox(height: 10.0),
        Text(
          "Fried Banana",
          style: TextStyle(fontSize: 10.0),
        )
      ],
    );
  }
}
