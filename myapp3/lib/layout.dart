import 'package:flutter/material.dart';
import 'dart:math';

class LayoutApp extends StatelessWidget {
  const LayoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   so
      //   backgroundColor: Colors.red,
      //   // fontFamily: "Pacifico",
      // ),
      home: Layout(),
    );
  }
}

class Layout extends StatefulWidget {
  Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final weekday = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        title: const Text("Weather Forecast"),
        centerTitle: true,
      ),
      backgroundColor: Colors.red[700],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                label: Text(
                  "Enter City Name",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                // label: Text("Enter City Name"),
              ),
            ),
          ),
          const SizedBox(height: 15,),
          const Text(
            "Murmansk Oblast, RU",
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
            ),
          ),
          const Text(
            "Friday, Mar 20, 2020",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 35,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.wb_sunny,
                size: 75,
                color: Colors.white,
              ),
              const SizedBox(
                width: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "14 °F",
                    style: TextStyle(
                      fontSize: 50,
                      letterSpacing: 5,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "LIGHT SNOW",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 45,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    Icons.ac_unit,
                    size: 25,
                    color: Colors.white,
                  ),
                  Text(
                    "5",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "km/hr",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: const <Widget>[
                  Icon(
                    Icons.ac_unit,
                    size: 25,
                    color: Colors.white,
                  ),
                  Text(
                    "3",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "%",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: const <Widget>[
                  Icon(
                    Icons.ac_unit,
                    size: 25,
                    color: Colors.white,
                  ),
                  Text(
                    "20",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "%",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40,),
          const Text(
            "7-DAY WEATHER FORECAST",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  7,
                  (index) => Container(
                        height: 100,
                        width: 150,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        color: Colors.red[300],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              weekday[(4 + index) % 7],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${5 + Random().nextInt(5)} °F ",
                                  style: const TextStyle(
                                    fontSize: 32,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                const Icon(
                                  Icons.wb_sunny,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}