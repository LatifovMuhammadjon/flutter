import 'package:flutter/material.dart';

class HomeWorkApp extends StatelessWidget {
  const HomeWorkApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        fontFamily: "Pacifico",
      ),
      color: Colors.indigo,
      home: const HomeWork(),
    );
  }
}

class HomeWork extends StatefulWidget {
  const HomeWork({Key? key}) : super(key: key);

  @override
  State<HomeWork> createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
  late int _counter;
  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[300],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("HomeWork"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'Tap "-" to decrement',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                height: 60,
                color: Colors.indigo[400],
                child: const Icon(
                  Icons.remove,
                  size: 32,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _counter = _counter > 0 ? _counter - 1 : 0;
                  });
                },
              ),
              MaterialButton(
                height: 60,
                color: Colors.indigo[400],
                child: Text(
                  "$_counter",
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
              MaterialButton(
                height: 60,
                color: Colors.indigo[400],
                child: const Icon(
                  Icons.add,
                  size: 32,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(30),
            child: Text(
              'Tap "+" to increment',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
